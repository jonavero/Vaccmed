class Api::V1::CollaboratorsController < ApplicationController

#  before_action :authenticate_user, only: [:create,:index,:show,:update]
  before_action :set_collaborator, only: [:show]

  def index

    @collaborators= if params[:search]
                      @count=  Colaborador.where('"names" ILIKE ?',"%#{params[:search]}%").count
               Colaborador.where('"names" ILIKE ?',"%#{params[:search]}%").paginate(:page => params[:skip], :per_page => params[:maxCount])

                    else
                      @count= Colaborador.count
                     Colaborador.joins(:branch_office,:role).paginate(:page => params[:skip], :per_page => params[:maxCount])
             end

  end

  def show
    @collaborator =Colaborador.joins(:branch_office,:role).find(params[:id])

   # @branchOffice= BranchOffice.select(Arel.star).where(Colaborador.arel_table[:id].eq(@collaborator.id)).joins(
       # BranchOffice.arel_table.join(Colaborador.arel_table).on(Colaborador.arel_table[:branch_office_id].eq(BranchOffice.arel_table[:id])).join_sources)
  end

  def create


    @mensaje='Usuario no creado'
    @user = User.create(:username=>params[:colaboradors][:names]+params[:colaboradors][:surname],:email=>params[:colaboradors][:email],:password=>'Nuevo1234',:password_confirmation=>'Nuevo1234',:createBy=>'jonacas',:role_id=>params[:colaboradors][:rolId])
    params[:colaboradors][:user_id]= @user.id
    if @user.save
      UserSignupMailer.send_signup_email(@user).deliver


      @collaborator= Colaborador.new(collaborator_params)
      if @collaborator.save
        render json: @collaborator, status: :created
      else
        render json: @collaborator.errors,status:  :unprocessable_entity
      end
    else
      @mensaje='Correo ya existen'
      render 'mensaje',status:  :unprocessable_entity
    end





  end

  def update
    @mensaje='Id no especificado'
    if params[:colaboradors][:id]
      @collaborator = Colaborador.where('id=?',params[:colaboradors][:id])
      if @collaborator.update(collaborator_params)
        @mensaje='Registro Actualizado'
        render 'mensaje',status: :created
      else
        render json: @collaborator.errors,status: :unprocessable_entity
      end

    else
      render 'mensaje',status: :unprocessable_entity

    end



  end

  private

  def set_collaborator
    @collaborator = Colaborador.find(params[:id])
  end

  def collaborator_params
    params.require(:colaboradors).permit(:id,:names,:surname,:status,:email,:address,:centroId,:rolId,:createBy,:user_id)
  end

end
