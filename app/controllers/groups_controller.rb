class GroupsController < ApplicationController

  #post 'add_new_group'
  def add_new_group
    # should not be owner of another group
    if current_user.is_owner?
      flash[:notice] = "You are currently a member of another group. Leave it to create your own group. [Sketchy]!!"
      redirect_to action: 'index'
      return
    end

    # group name should not be blank
    if params[:group_name].blank?
      redirect_to :back, notice: "Group name cannot be blank"
      return
    else
      # new group should have a unique name
      if Group.find_by_name(params[:group_name].titlecase)
        flash[:notice] = "This Group Name is already taken. Please choose another one."
        redirect_to action: 'index'
        return
      end

      # delete pending requests
      current_user.my_requests.each do |group|
        GroupMember.where(group_id: group.id, student_id: current_user.id, requested: true).first.destroy
      end

      # create new group
      group = Group.create(name: params[:group_name].titlecase)
      GroupMember.create(group_id: group.id, student_id: current_user.id, member: true)
      
      # add semester attribute to group, based on first group member
      group.semester_id = current_user.section.semester.id
      group.save

      redirect_to action: 'index'
    end
  end


  #post 'send_request'
  def send_request
    # should not be owner of another group
    if current_user.is_owner?
      flash[:notice] = "You are currently a member of another group. Leave it to send a request to join another group. [Sketchy]!!"
      redirect_to action: 'index'
      return
    end

    # passed name should be a valid group
    group = Group.find_by_name(params[:group_name])
    if group.nil?
      flash[:notice] = "There does not exist a group with that name. Please try again."
      redirect_to action: 'index'
      return
    end

    # request should not be a duplicate - done in the model

    # create request
    GroupMember.create(group_id: group.id, student_id: current_user.id, requested: true)

    redirect_to action: 'index'
  end


  #get 'accept_invite'
  def accept_invite
    # should not be owner of another group
    if current_user.is_owner?
      flash[:notice] = "You are currently a member of another group. Leave it to accept invite. [Sketchy]!!"
      redirect_to action: 'index'
      return
    end

    # check if there exists an invite
    gm = GroupMember.where(group_id: params[:group_id], student_id: current_user.id, invited: true)
    if gm.nil?
      flash[:notice] = "You dont have an invite to join the group. Please request one. [Sketchy]!!"
      redirect_to action: 'index'
      return
    end

    # mark the user as a member
    gm = gm.first
    gm.invited = false;
    gm.member = true;
    gm.save

    redirect_to action: 'index'
  end


  #get 'reject_invite'
  def reject_invite
    # check if there exists an invite
    gm = GroupMember.where(group_id: params[:group_id], student_id: current_user.id, invited: true)
    if gm.nil?
      flash[:notice] = "You dont have an invite to reject. [Sketchy]!!"
      redirect_to action: 'index'
      return
    end

    # delete the invite
    gm = gm.first
    gm.destroy

    redirect_to action: 'index'
  end


  #get 'leave_group'
  def leave_group
    group = current_user.my_group

    # is current_user an owner of the passed group?
    #if not current_user.my_group == group
    #  flash[:notice] = "You are not a member of this group. [Sketchy]!!"
    #  redirect_to action: 'index'
    #  return
    #end

    # remove from group
    GroupMember.where(group_id: group.id, student_id: current_user.id, member: true).first.destroy

    # remove current_user's pending sent requests
    current_user.my_requests.each do |group|
      GroupMember.where(group_id: group.id, student_id: current_user.id, requested: true).first.destroy
    end

    # delete group if the group does not have an owner
    if group.owners.count == 0
      group.destroy
    end

    redirect_to action: 'index'
  end


  #post 'send_invite'
  def send_invite
    group = current_user.my_group

    # is current_user an owner of the passed group?
    #if not current_user.my_group == group
    #  flash[:notice] = "You are not a member of this group. [Sketchy]!!"
    #  redirect_to action: 'index'
    #  return
    #end

    student = Student.find_by_gtusername(params[:student_gtusername])
    
    # check if student exists
    if student.nil?
      flash[:notice] = "The gtusername you entered does not exist in the system. Check spellings and make sure the student has completed his/her profile"
      redirect_to action: 'index'
      return
    end

    # check if the invited student is in the same semster as the group
    if student.semester != group.semester
      flash[:notice] = "The gtusername you entered is not in the same semester as your group"
      redirect_to action: 'index'
      return
    end

    # If invited student is already a member of another group, will notify requester that that person will need to leave that group in order to accept the new invite
    if student.is_owner?
      flash[:notice] = "Invite sent successfully. #{params[:student_gtusername]} is already a member of another group.  He/She will need to leave their current group in order to accept your invite."
    end
    # create invite
    GroupMember.create(group_id: group.id, student_id: student.id, invited: true)

    redirect_to action: 'index'
  end


  #get 'accept_request'
  def accept_request
    group = current_user.my_group
    student = Student.find(params[:student_id])

    # check if request exists
    gm = GroupMember.where(group_id: group.id, student_id: student.id, requested: true)
    if gm.nil?
      flash[:notice] = "The request does not exist. [Sketchy]!!"
      redirect_to action: 'index'
      return
    end

    gm = gm.first
    gm.requested = false
    gm.member = true
    gm.save

    redirect_to action: 'index'
  end


  #get 'reject_request'
  def reject_request
    group = current_user.my_group
    student = Student.find(params[:student_id])

    # check if request exists
    gm = GroupMember.where(group_id: group.id, student_id: student.id, requested: true)
    if gm.nil?
      flash[:notice] = "The request does not exist. [Sketchy]!!"
      redirect_to action: 'index'
      return
    end

    gm.first.destroy

    redirect_to action: 'index'
  end



  # GET /groups
  # GET /groups.json
  def index
    if current_user.isAdmin?
      @groups = Group.all

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @groups }
      end

    elsif current_user.isStudent?
      @groups = Group.all

      respond_to do |format|
        format.html { render 'index_student' }
        format.json { render json: @groups }
      end
    end

    @groups = Group.all
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
    @group = Group.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @group }
    end
  end

  # GET /groups/new
  # GET /groups/new.json
  def new
    @group = Group.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @group }
    end
  end

  # GET /groups/1/edit
  def edit
    @group = Group.find(params[:id])
  end

  # POST /groups
  # POST /groups.json
  def create
    @group = Group.new(params[:group])

    respond_to do |format|
      if @group.save
        format.html { redirect_to @group, notice: 'Group was successfully created.' }
        format.json { render json: @group, status: :created, location: @group }
      else
        format.html { render action: "new" }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /groups/1
  # PUT /groups/1.json
  def update
    @group = Group.find(params[:id])

    respond_to do |format|
      if @group.update_attributes(params[:group])
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group = Group.find(params[:id])
    @group.destroy

    respond_to do |format|
      format.html { redirect_to groups_url }
      format.json { head :no_content }
    end
  end
end
