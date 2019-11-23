class QuizAttemptsController < ApplicationController
  before_action :set_quiz_attempt, only: [:show, :edit, :update, :destroy]

  # GET /quiz_attempts
  # GET /quiz_attempts.json
  def index
    @quiz_attempts = QuizAttempt.all
  end

  # GET /quiz_attempts/1
  # GET /quiz_attempts/1.json
  def show
  end

  # GET /quiz_attempts/new
  def new
    @quiz_attempt = QuizAttempt.new
  end

  # GET /quiz_attempts/1/edit
  def edit
  end

  # POST /quiz_attempts
  # POST /quiz_attempts.json
  def create
    @quiz_attempt = QuizAttempt.new(quiz_attempt_params)

    respond_to do |format|
      if @quiz_attempt.save
        format.html { redirect_to @quiz_attempt, notice: 'Quiz attempt was successfully created.' }
        format.json { render :show, status: :created, location: @quiz_attempt }
      else
        format.html { render :new }
        format.json { render json: @quiz_attempt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quiz_attempts/1
  # PATCH/PUT /quiz_attempts/1.json
  def update
    respond_to do |format|
      if @quiz_attempt.update(quiz_attempt_params)
        format.html { redirect_to @quiz_attempt, notice: 'Quiz attempt was successfully updated.' }
        format.json { render :show, status: :ok, location: @quiz_attempt }
      else
        format.html { render :edit }
        format.json { render json: @quiz_attempt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quiz_attempts/1
  # DELETE /quiz_attempts/1.json
  def destroy
    @quiz_attempt.destroy
    respond_to do |format|
      format.html { redirect_to quiz_attempts_url, notice: 'Quiz attempt was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quiz_attempt
      @quiz_attempt = QuizAttempt.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quiz_attempt_params
      params.fetch(:quiz_attempt, {})
    end
end
