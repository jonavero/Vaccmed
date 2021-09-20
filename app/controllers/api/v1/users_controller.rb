class Api::V1::UsersController < ApplicationController
  before_action :authenticate_user, only: [:create,:index,:show]
  before_action :set_user, only: [:show]
  def index
    @users =User.all
    render json: @users
  end

  def show
    @user= User.joins(:colaborador).find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @mensaje='Registro Creado'
      render 'mensaje',status: :created
    else
      render json: @user.errors,status:  :unprocessable_entity
    end
  end

  def current

    @current_user = User.joins(colaborador:[:role]).find_by(:id=> current_user.id)
    # render json: @current_user.as_json(only: %i(id username email colaborador_id))
      #render json: current_user.joins("INNER JOIN colaboradors ON colaboradors.id= current_user.colaborador_id")



  end



  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username,:email,:password,:password_confirmation,:createBy,:colaborador_id,:role_id)
  end
end
