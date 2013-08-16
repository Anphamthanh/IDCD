class UsersController < ApplicationController

  skip_before_filter :require_login

  def tester_login
    session['test_user'] = User.find(params[:test_user_id]).gtusername

    if current_user.incompleteProfile?
      flash[:error] = "Please complete the one-time registration. Do not leave any field blank."
      if current_user.isStudent?
        redirect_to edit_student_path(current_user)
      elsif current_user.isFaculty?
        redirect_to edit_faculty_path(current_user)
      else
        redirect_to edit_user_path(current_user)
      end
      return
    end

    redirect_to home_url
  end

  def tester_logout
    session.delete(:test_user)

    redirect_to users_url
  end

  def add_faculty
    gtusername = params[:gtusername]
    selected_school = params[:selectedSchool][0].to_i

    if Faculty.find_by_gtusername(gtusername)
      flash[:notice] = "GTUsername \"#{gtusername}\" is already marked as Faculty"
    elsif Student.find_by_gtusername(gtusername)
      user = Student.find_by_gtusername(gtusername)
      user.type = "Faculty"
      user.school_id = selected_school
      user.save
    else
      Faculty.create(gtusername: gtusername, school_id: selected_school)
    end

    redirect_to users_url
  end

  def delete_faculty
    f = Faculty.find(params[:id])
    f.projects.clear
    user = User.find(params[:id])
    user.school_id = nil
    user.type = "Student"
    user.save

    flash[:notice] = "User \"#{user.gtusername}\" is now marked as a student"

    redirect_to users_url
  end

  def give_admin_status
    gtusername = params[:gtusername]
    if User.find_by_gtusername(gtusername)
      user = User.find_by_gtusername(gtusername)
      user.admin = true
      user.save
      flash[:notice] = "User \"#{user.gtusername}\" is now an Admin"
    else
      flash[:notice] = "User \"#{gtusername}\" does not exist."
    end

    redirect_to users_url
  end

  def remove_admin_status
    user = User.find(params[:id])
    user.admin = false
    user.save

    flash[:notice] = "User \"#{user.gtusername}\" is no longer an Admin"

    redirect_to users_url
  end

  def add_test_user
    gtusername = params[:gtusername]
    if User.find_by_gtusername(gtusername)
      flash[:notice] = "User \"#{gtusername}\" is an existing user. Please choose another GTUsername"
    else
      if params[:test_user_type] == "Admin"
        user = User.create(gtusername: gtusername, test: true, admin: true)
      elsif params[:test_user_type] == "Faculty"
        user = User.create(gtusername: gtusername, type: params[:test_user_type], test: true, school_id: params[:selectedSchool][0])
      else
        user = User.create(gtusername: gtusername, type: params[:test_user_type], test: true)
      end
      flash[:notice] = "User \"#{user.gtusername}\" is a #{user.type} test user. Use the links in the footer to log in as a Test User."
    end


    redirect_to users_url
  end

  def remove_test_user
    user = User.find(params[:id])
    if user.isFaculty?
      f = Faculty.find(params[:id])
      f.projects.clear
    end
    gtusername = user.gtusername
    user.destroy

    flash[:notice] = "User \"#{gtusername}\" has been deleted"

    redirect_to users_url
  end


  # GET /users
  # GET /users.json
  def index
    if current_user.isAdmin?
      @users = User.all
      @students = Student.all
      @faculty = Faculty.all

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @users }
      end
      return

    else
      @user = User.find(current_user.id)

      respond_to do |format|
        format.html { redirect_to home_url }
      end
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    if !(current_user.isAdmin? or current_user == @user) 
      redirect_to home_path, notice: "Unauthorized!"
      return
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
    if !(current_user.isAdmin? or current_user == @user)
      redirect_to home_path, notice: "Unauthorized!"
      return
    end
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])
    if @user.is_a? Student
      updated_params = params[:student]
    elsif @user.is_a? Faculty
      updated_params = params[:faculty]
    else
      updated_params = params[:user]
    end

    respond_to do |format|
      if @user.update_attributes(updated_params)
        if @user.incompleteProfile?
          format.html { redirect_to edit_user_path(@user), notice: 'Please fill out all details to complete profile.' }
          format.json { head :no_content }
        else
          format.html { redirect_to @user, notice: 'User was successfully updated.' }
          format.json { head :no_content }
        end
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
end
