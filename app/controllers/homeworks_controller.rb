class HomeworksController < ApplicationController
  before_action :set_homework, only: [:show, :edit, :update, :destroy]

  def assign
    @homework = Homework.find(params[:id])
    # only students are sent with the instance variables users
    @assignments = @homework.assignments
    @users = User.where(usertype: 'Student')
  end


  def assigned
    @homework = Homework.find(params[:homeworkid])
    @homework.assignments.delete_all
    # receive the input values. Loop through the usersnames and go to the 
    # users table and have a list of ids
    # can print the usernames array and look in terminal to see list of usernames
    usersnames = Array.new
    usersnames = params['studentidlist'].split(',')
    
    usersnames.each do |u|
      # got the user
      @checkedUser = User.where(username: u).first

      # i printed it off and looked in ther terminal to see if a user value is received. Should run correct
      #puts @checkedUser

      # now in a userQuestions table we need to send a entry. That entry will have user.id and hw.id. Showing what users are assigned
      # that hw.id

       assignment = Assignment.new
       assignment.user_id = @checkedUser.id
       assignment.homework_id = Integer(params['homeworkid']) 
       assignment.save
    end

    respond_to do |format|
      if usersnames.length > 0
        format.html { redirect_to homeworks_path, notice: 'Homework successfully assigned.' }
      else
        format.html { render :assigned }
      end
    end

  end

  # GET /homeworks
  # GET /homeworks.json
  def index
    @homeworks = Homework.all
  end

  # GET /homeworks/1
  # GET /homeworks/1.json
  def show
  end

  # GET /homeworks/new
  def new
    @homework = Homework.new
  end

  # GET /homeworks/1/edit
  def edit
  end

  # POST /homeworks
  # POST /homeworks.json
  def create
    @homework = Homework.new(homework_params)

    respond_to do |format|
      if @homework.save
        format.html { redirect_to @homework, notice: 'Homework was successfully created.' }
        format.json { render :show, status: :created, location: @homework }
      else
        format.html { render :new }
        format.json { render json: @homework.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /homeworks/1
  # PATCH/PUT /homeworks/1.json
  def update
    respond_to do |format|
      if @homework.update(homework_params)
        format.html { redirect_to @homework, notice: 'Homework was successfully updated.' }
        format.json { render :show, status: :ok, location: @homework }
      else
        format.html { render :edit }
        format.json { render json: @homework.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /homeworks/1
  # DELETE /homeworks/1.json
  def destroy
    @homework.destroy
    respond_to do |format|
      format.html { redirect_to homeworks_url, notice: 'Homework was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_homework
      @homework = Homework.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def homework_params
      params.require(:homework).permit(:title, :question, :duedate)
    end
end
