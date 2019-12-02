class VideosController < ApplicationController
  before_action :set_video, only: [:show, :edit, :update, :destroy]

  # GET /videos
  # GET /videos.json
  def index
    redirect_to '/results' if current_attempt.complete
    @full = true
    @videos = authorize Video.all
    @current_attempt = current_user.quiz_attempts.completed.last
    @videos = @videos.map do |video|
      video.as_json(only: %i[id url title description]).merge(
        complete: current_attempt.quiz_attempts.complete.where(quiz: video.quiz).any?
      )
    end
    # @videos = @videos.map{|vid| vid.quizzes.map {|quiz| quiz.current_attempt(current_user)}}

    @props = {videos: @videos, currentAttempt: @current_attempt}
  end

  # GET /videos/1
  # GET /videos/1.json
  def show
    @full = true
    @props = {video: @video.as_json(include: :quizzes)}
  end

  # GET /videos/new
  def new
    @video = Video.new
  end

  # GET /videos/1/edit
  def edit
  end

  # POST /videos
  # POST /videos.json
  def create
    @video = Video.new(video_params)

    respond_to do |format|
      if @video.save
        format.html { redirect_to @video, notice: 'Video was successfully created.' }
        format.json { render :show, status: :created, location: @video }
      else
        format.html { render :new }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /videos/1
  # PATCH/PUT /videos/1.json
  def update
    respond_to do |format|
      if @video.update(video_params)
        format.html { redirect_to @video, notice: 'Video was successfully updated.' }
        format.json { render :show, status: :ok, location: @video }
      else
        format.html { render :edit }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /videos/1
  # DELETE /videos/1.json
  def destroy
    @video.destroy
    respond_to do |format|
      format.html { redirect_to videos_url, notice: 'Video was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_video
      @video = Video.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def video_params
      params.require(:video).permit(:url, :poster, :status, :created_at, :updated_at, :title, :description, :overview)
    end
end
