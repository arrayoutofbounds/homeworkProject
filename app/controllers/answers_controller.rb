class AnswersController < ApplicationController
  before_action :set_answer, only: [:show, :edit, :update, :destroy]

  # GET /answers
  # GET /answers.json
  def index
    @answers = Answer.all
  end

  # GET /answers/1
  # GET /answers/1.json
  def show
  end

  # GET /answers/new
  def new
    @answer = Answer.new
  end

  def new_answer
    @homework = Homework.find(params[:homework_id])
    @answer = Answer.new
    @answer.homework_id = @homework.id

  end

  def index_naswers
    @homework = Homework.find(params[:homework_id])
    @answers = @homework.answers
  end

  def create_new_answer 
     @homework = Homework.find(params[:homework_id])
     @answer = Answer.new
     @answer.homework_id = @homework.id
     @answer.user_id = current_user.id
     @answer.body = answer_params[:body]

    respond_to do |format|
      if @answer.save
        format.html { redirect_to homeworks_path, notice: 'Answer was successfully created.' }
      else
        format.html { render :new_answer }
      end
    end
     
  end


  def show_answers
     @homework = Homework.find(params[:homework_id])
     @answers = @homework.latest_answers
  end

  def show_users_homework_answers
    @user = User.find(params[:user_id])
    @homework = Homework.find(params[:homework_id])
    @answers = @user.answers
  end

  # GET /answers/1/edit
  def edit
  end

  # POST /answers
  # POST /answers.json
  def create
    @answer = Answer.new(answer_params)

    respond_to do |format|
      if @answer.save
        format.html { redirect_to @answer, notice: 'Answer was successfully created.' }
        format.json { render :show, status: :created, location: @answer }
      else
        format.html { render :new }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /answers/1
  # PATCH/PUT /answers/1.json
  def update
    respond_to do |format|
      if @answer.update(answer_params)
        format.html { redirect_to @answer, notice: 'Answer was successfully updated.' }
        format.json { render :show, status: :ok, location: @answer }
      else
        format.html { render :edit }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /answers/1
  # DELETE /answers/1.json
  def destroy
    @answer.destroy
    respond_to do |format|
      format.html { redirect_to answers_url, notice: 'Answer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer
      @answer = Answer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def answer_params
      params.require(:answer).permit(:user_id, :homework_id, :body)
    end
end
