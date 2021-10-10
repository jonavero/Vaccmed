class  Api::V1:: PatientsController < ApplicationController
  before_action :set_patient, only: [:show,:update]
#  before_action :authenticate_user, only: [:create,:index,:show,:update,:PatientTutor,:showForName]
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


  def PatientTutor
    @patientTutor = if params[:id]
                     Dependent.joins(:patient, :tutor,:relationship).where('"patient_id" = ?',params[:id] )
                   else

                   end

  end

  def showForName
    @patientsName = if params[:search]
                      Patient.where('"name" ILIKE ?',"%#{params[:search]}%").paginate(:page => params[:skip], :per_page => params[:maxCount])
                    end
  end

  def vaccineCard


    @mensaje="ID Paciente no especificado"

    if params[:idPatient]
      @patient = Patient.find_by(:id=>params[:idPatient])
      @appointment =Appointment.joins('INNER JOIN "appointment_details"
      ON "appointment_details"."appointment_id" = "appointments"."id"
      Inner join "vaccines"
      ON  "vaccines".id ="appointment_details"."vaccine_id"').select('"appointments"."appointmentDate","vaccines"."name","appointments"."branch_office_id","appointment_details"."nurseName"').where('"patient_id"=? and appointments.status=?',params[:idPatient],'Realizada')

    else
      render 'mensaje'
    end
  end


  def create

    @patient= Patient.new(patients_params)
    if @patient.save
      @mensaje='Registro Creado'
      render 'mensajeSucc',status: :created
    else
      render json: @patient.errors,status:  :unprocessable_entity
    end
  end



  def update


    @mensaje='Id no especificado'
    if params[:patient][:id]
      @patient = Patient.where('id=?',params[:patient][:id])
      if @patient.update(patients_params)
        @mensaje='Registro Actualizado'
        render 'mensaje',status: :created
      else
        render json: @patient.errors,status: :unprocessable_entity
      end
    else
      render 'mensaje',status: :unprocessable_entity
    end


  end


  private

  def patients_params
    params.require(:patient).permit(:id,:name,:surname,:identityCard,:gender,:birthday,:createdBy)
  end

  def set_patient
    @patient= Patient.find(params[:id])
  end
end
