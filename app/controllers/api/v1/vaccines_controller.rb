class Api::V1::VaccinesController < ApplicationController

  before_action :authenticate_user, only: [:create,:index,:show]
  before_action :set_vaccine, only: [:show,:update,:updateStatus]

  def index


    @vaccines= if params[:search]
                 @count=Vaccine.where('"description" ILIKE ?',"#{params[:search]}%").count
                 Vaccine.where('"description" ILIKE ?',"#{params[:search]}%").paginate(:page => params[:skip], :per_page => params[:maxCount])
               else
                 @count=Vaccine.count
                 Vaccine.paginate(:page => params[:skip], :per_page => params[:maxCount])
               end
  end

  def show

  end

  def create
   @vaccine= Vaccine.new(vaccine_params)
    if @vaccine.save
      @mensaje='Registro Creado'
      render 'mensaje',status: :created
    else
      render json: @vaccine.errors,status: :unprocessable_entity
    end

  end

  def update
    if @vaccine.update(vaccine_params)
      @mensaje='Registro Actualizado'
      render 'mensaje',status: :created
    else
      render json: @vaccine.errors,status: :unprocessable_entity
    end
  end

  def updateStatus
    if @vaccine.update(status_params)
      @mensaje='Registro Actualizado'
      render 'mensaje',status: :created
    else
    render json: @vaccine.errors, status: :unprocessable_entity
    end
  end

  private

  def set_vaccine
    @vaccine = Vaccine.find(params[:id])
  end

  def vaccine_params
    params.require(:vaccine).permit(:name,:description,:status,:dose,:typeDose,:createBy,:edadMinima,:edadMaxima)
  end

  def status_params
    params.require(:vaccine).permit(:status)
  end
end
