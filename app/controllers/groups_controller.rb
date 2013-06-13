class GroupsController < ApplicationController

  def accept_request
    group = Group.find_by_name(params['group_name'])
    student = Student.find_by_gtusername(params['student_gtusername'])
    redirect_to action: 'index'
  end

  def request_to_join

    # retrieve student creating group
    student = Student.find_by_gtusername(params['student_gtusername'])

    # find group
    group = Group.find_by_name(params['group_name'])
    if not group
      flash[:notice] = "Group not found"
      redirect_to action: 'index'
      return
    end

    # do nothing if request already exists
    if GroupMember.where("student_id = ? and group_id = ? and requested = true", student.id, group.id).count > 0
      flash[:notice] = "Request already exists"
      redirect_to action: 'index'
      return
    end

    # destroy previous memberships
    if student.group_member_of
      old_group = student.group_member_of
      remove_membership_of_student_x_from_group_y(student, old_group)
    end

    # add student to group
    GroupMember.create( group_id: group.id, student_id: student.id, requested: true)

    redirect_to action: 'index'
  end


  def leave_group

    # retrieve student creating group
    student = Student.find_by_gtusername(params['student_gtusername'])

    # destroy membership from current group
    if student.group_member_of
      old_group = student.group_member_of
      remove_membership_of_student_x_from_group_y(student, old_group)
    end

    redirect_to action: 'index'
  end


  def new_student_group

    # retrieve student creating group
    student = Student.find_by_gtusername(params['student_gtusername'])

    # destroy previous memberships
    if student.group_member_of
      old_group = student.group_member_of
      remove_membership_of_student_x_from_group_y(student, old_group)
    end

    # create new group
    group = Group.create( name: params['group_name'])

    # add student to group
    GroupMember.create( group_id: group.id, student_id: student.id, member: true)

    redirect_to action: 'index'
  end

  def remove_membership_of_student_x_from_group_y (student, group)
    #TODO check for how many group owners are left and delete all requests and invites
    GroupMember.where("student_id = ? and group_id = ? and member = true", student.id, group.id).first.destroy
    if group.group_members.count == 0
      group.destroy
    end
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
