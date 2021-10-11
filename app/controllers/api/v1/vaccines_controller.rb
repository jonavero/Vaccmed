class Api::V1::VaccinesController < ApplicationController

  #before_action :authenticate_user, only: [:create,:index,:show]
  before_action :set_vaccine, only: [:updateStatus]

  def index


    @vaccines= if params[:search]
                 @count=Vaccine.where('"description" ILIKE ? or "name" ILIKE ? ',"%#{params[:search]}%","%#{params[:search]}%").count
                 Vaccine.where('"description" ILIKE ? or "name" ILIKE ? ',"%#{params[:search]}%","%#{params[:search]}%").paginate(:page => params[:skip], :per_page => params[:maxCount])
               else
                 @count=Vaccine.count
                 Vaccine.paginate(:page => params[:skip], :per_page => params[:maxCount])
               end
  end




  def vaccineList
    if params[:idPatient]
      @patient= Patient.find_by('id =?',params[:idPatient])
      edadMaxima=((Date.today - @patient.birthday).to_f / 30).floor

      @vaccines= Vaccine.where('"edadMinima" <= ? and "edadMaxima" >= ? and status= ? ',edadMaxima,edadMaxima,"Active")

    else
      @mensaje='Paciente id no especificado'
      render 'mensaje',status: :created
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
    @mensaje='Id no especificado'
    if params[:vaccine][:id]
      @vaccine = Vaccine.where('id=?',params[:vaccine][:id])
    if @vaccine.update(vaccine_params)
      @mensaje='Registro Actualizado'
      render 'mensaje',status: :created
    else
      render json: @vaccine.errors,status: :unprocessable_entity
    end
    else
      render 'mensaje',status: :unprocessable_entity
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
    params.require(:vaccine).permit(:id,:name,:description,:status,:dose,:typeDose,:createBy,:minAge,:maxAge)
  end

  def status_params
    params.require(:vaccine).permit(:status)
  end
end
