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
      UserSignupMailer.send_signup_email(@user).deliver
      render 'mensaje',status: :created
    else
      render json: @user.errors,status:  :unprocessable_entity
    end
  end

  def current

    @current_user = User.joins(:role).find_by(:id=> current_user.id)

    if @current_user.role.description == "Collaborator" || @current_user.role.description == "Admin" ||@current_user.role.description == "Nurse"
      @current= Colaborador.joins(:user).find_by(:user_id => @current_user.id)
    else
      @current= Tutor.joins(:user).find_by(:user_id => @current_user.id)
      render 'currentTutor'
    end



  end

  def changePassword
    @mensaje='Id no especificado'
    if params[:user][:id] && params[:user][:passwordOld]
      @user = User.find_by(:id =>params[:user][:id])

      password_hash =BCrypt::Password.new(@user.password_digest)
      if password_hash == params[:user][:passwordOld]
      if @user.update(password_params)
        @mensaje='Registro Actualizado'
        render 'mensaje',status: :created
      else
        render json: @user.errors,status: :unprocessable_entity
      end
      else
        @mensaje='contraseña actual incorrecta'
        render 'mensaje',status: :unprocessable_entity
      end
    else
      render 'mensaje',status: :unprocessable_entity
    end

  end

  def changePasswordEmail
    if params[:user][:email]
      @user = User.find_by_email(params[:user][:email])
      @password='123456789'
     if  @user.update(:password => @password)

       UserSignupMailer.send_password(@user).deliver
       @mensaje='Clave Enviada'
       render 'mensaje',status: :created
     else
       @mensaje='Clave no enviada'
       render 'mensaje',status: :unprocessable_entity
     end

    else
      @mensaje='email no valido'
      render 'mensaje',status: :unprocessable_entity
    end
  end



  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username,:email,:password,:password_confirmation,:createBy,:role_id)
  end

  def password_params
    params.require(:user).permit(:id,:password)
  end

end
