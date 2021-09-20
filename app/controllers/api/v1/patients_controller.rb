class  Api::V1:: PatientsController < ApplicationController
  before_action :set_patient, only: [:show,:update]
  before_action :authenticate_user, only: [:create,:index,:show,:update]
  def index
    @patients= if params[:search]
               @count =Patient.where('"name" ILIKE ?',"%#{params[:search]}%").count
               Patient.where('"name" ILIKE ?',"%#{params[:search]}%").paginate(:page => params[:skip], :per_page => params[:maxCount])
             else
               @count =Patient.count
               Patient.paginate(:page => params[:skip], :per_page => params[:maxCount]).order(:id)
             end
  end

  def show

  end

  def create

    @patient= Patient.new(patients_params)
    if @patient.save
      @mensaje='Registro Creado'
      render 'mensaje',status: :created
    else
      render json: @patient.errors,status:  :unprocessable_entity
    end
  end



  def update
    if @patient.update(patients_params)
      @mensaje='Registro Actualizado'
      render 'mensaje',status: :created
    else
      render json: @patient.errors,status:  :unprocessable_entity
    end
  end


  private

  def patients_params
    params.require(:patient).permit(:name,:surname,:identityCard,:gender,:birthday,:createdBy)
  end

  def set_patient
    @patient= Patient.find(params[:id])
  end
end