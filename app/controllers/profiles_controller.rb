class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :update, :destroy]
  skip_before_action :verify_authenticity_token, only: :update

  # GET /profiles
  # GET /profiles.json
  def index
    @profiles = Profile.all
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
  end

  # GET /profiles/new
  def new
    @profile = Profile.new
  end

  # GET /profiles/1/edit
  def edit
    @profile = current_user&.profile || Profile.create(user: current_user)
    @props = {
      profile: @profile,
      sports: Profile::SPORTS,
      ages: Profile.age_levels.keys.collect {|k| {value: k, label: k.humanize}},
      genders: Profile::GENDERS,
      selectedSports: @profile.sports,
      ageLevel: @profile.age_level,
      selectedGenders: @profile.genders,
      yearsExperience: @profile.years_experience,
      previousTraining: @profile.previous_training,
    }
  end

  # POST /profiles
  # POST /profiles.json
  def create
    @profile = Profile.new(profile_params)

    respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile, notice: 'Profile was successfully created.' }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        format.json { render json: {profile: @profile, location: checkout_path}, status: :ok }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url, notice: 'Profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit({sports: []}, :age_level, {genders: []}, :years_experience, :previous_training)
    end
end
