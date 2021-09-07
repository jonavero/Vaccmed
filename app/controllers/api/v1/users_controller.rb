class Api::V1::UsersController < ApplicationController
 # before_action :authenticate_user, only: [:create,:index,:show]
  before_action :set_user, only: [:show]
  def index
    @users =User.all
    render json: @users
  end

  def show
    render json: @user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors,status:  :unprocessable_entity
    end
  end

  def current
    render json: current_user
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username,:email,:password,:password_confirmation,:createBy,:role_id,:colaborador_id)
  end
end
