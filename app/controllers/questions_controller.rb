class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy, :answer, :check_answer]
  skip_forgery_protection only: [:check_answer]
  
  before_action :authenticate_user!, except: [:new, :create, :answer, :check_answer]
  before_action :authenticate_admin_or_owner, except: [:new, :create, :answer, :check_answer]
  
  def authenticate_admin_or_owner
    is_owner = @question.present? && @question.user.id == current_user.id
    is_admin = current_user.admin?
    
    unless is_owner || is_admin
      redirect_to root_path
    end
  end
  
  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.all
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
  end
  
  # GET /questions/1/answer
  def answer
  end
  
  # POST /questions/1/check_answer
  def check_answer
    provided_answer = check_answer_params[:providedAnswer]
    
    is_correct_answer = @question.correct_answer == provided_answer
    
    if is_correct_answer == true
      @question.increment!(:correct_answers_received)
    else
      @question.increment!(:incorrect_answers_received)
    end
    
    render json: { correct_answer_given: is_correct_answer }
  end

  # GET /questions/new
  def new
    @question = Question.new
    
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(question_params)
    
    @question.user_id = user_signed_in? ? current_user.id : User.find_by_handle('LoggedOutUser').id

    respond_to do |format|
      if @question.save
        format.html { redirect_to answer_question_path(@question), notice: 'Question was successfully created.' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def question_params
      params.require(:question).permit(:question_text, :answer_a, :answer_b, :answer_c, :answer_d, :like_count, :dislike_count, :correct_answer, :correct_answers_received, :incorrect_answers_received, :tags)
    end
    
    def check_answer_params
      params.require(:question).permit(:providedAnswer)
    end
end
