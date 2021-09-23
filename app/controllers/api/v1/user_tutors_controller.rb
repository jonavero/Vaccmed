class Api::V1::UserTutorsController < ApplicationController
  before_action :set_user_tutor, only: %i[ show update destroy ]

  # GET /user_tutors
  # GET /user_tutors.json
  def index
    @count = UserTutor.joins(:tutor,:role).all.count
    @user_tutors = UserTutor.joins(:tutor,:role).all
  end

  # GET /user_tutors/1
  # GET /user_tutors/1.json
  def show
    @user= UserTutor.joins(:tutor,:role).find(params[:id])
  end

  def current

    @current_user = UserTutor.joins(tutor:[:role]).find_by(:id=> current_user.id)


  end

  # POST /user_tutors
  # POST /user_tutors.json
  def create
    @user_tutor = UserTutor.new(user_tutor_params)

    if @user_tutor.save
      render :show, status: :created, location: @user_tutor
    else
      render json: @user_tutor.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /user_tutors/1
  # PATCH/PUT /user_tutors/1.json
  def update
    if @user_tutor.update(user_tutor_params)
      render :show, status: :ok, location: @user_tutor
    else
      render json: @user_tutor.errors, status: :unprocessable_entity
    end
  end

  # DELETE /user_tutors/1
  # DELETE /user_tutors/1.json
  def destroy
    @user_tutor.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_tutor
      @user_tutor = UserTutor.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_tutor_params
      params.require(:user_tutor).permit(:role_id, :tutor_id, :identityCard, :email, :password,:password_confirmation, :createdBy)
    end
end
