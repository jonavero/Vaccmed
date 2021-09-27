class Api::V1::AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show,:update,:destroy]
  def index
    @appointments = if params[:status]
                      @count=  Appointment.joins(:patient,:tutor,:appointment_details ).where('"appointment.status" = ?',params[:status] ).count
                      Appointment.joins(:patient,:tutor,:appointment_details ).where('"status" = ?',params[:status] ).paginate(:page => params[:skip], :per_page => params[:maxCount]).order(:id)
                    else
                      @count =Appointment.count
                      Appointment.joins(:patient,:tutor,:appointment_details ).paginate(:page => params[:skip], :per_page => params[:maxCount]).order(:id).uniq
                    end
  end

  def show

          @detail_appointment =
              if params[:status]
                AppointmentDetail.where('"appointment_id"= ? and "status"= ?',@appointment.id,params[:status])
              else
                AppointmentDetail.where('"appointment_id"= ?',@appointment.id)
              end
  end

  def showVaccineList
    @mensaje="ID Paciente no especificado"

    if params[:idPatient]
    @appointment =Appointment.joins(:patient,:tutor,:appointment_details).where('"patient_id"=?',params[:idPatient]).uniq

    else
      render 'mensaje'
    end


  end


  def patientAppointment
    @mensaje="ID Paciente no especificado"
    if params[:idPatient]
      @appointments = Appointment.joins(:tutor).where('patient_id = ?', params[:idPatient])


    else
      render 'mensaje'
    end

  end


  def tutorAppointment
    @mensaje="ID Tutor no especificado"
    if params[:idTutor]
      if params[:search] || params[:status]
        @count= Appointment.joins(:tutor,:patient).where('"tutor_id" = ? and "status"=?', params[:idTutor],params[:status]).count

        @appointments = Appointment.joins(:tutor,:patient).where('"tutor_id" = ? and "status"=?', params[:idTutor],params[:status]).paginate(:page => params[:skip], :per_page => params[:maxCount]).order(:id)
      else
        @count= Appointment.joins(:tutor,:patient).where('tutor_id = ?', params[:idTutor]).count
        @appointments = Appointment.joins(:tutor,:patient).where('tutor_id = ?', params[:idTutor]).paginate(:page => params[:skip], :per_page => params[:maxCount]).order(:id)
      end


    else
      render 'mensaje'
    end
  end



  def counterAppointment
    @countComplete = Appointment.where('"status" =?',"Completada").count
    @countPending=Appointment.where('"status" =?',"Pendiente").count
  end

  def create
      @appointment =Appointment.new(params_appointment)
    if @appointment.save
      render json: @appointment, status: :created, location: api_v1_appointment_path(@appointment)
    else
      render json: @appointment.errors, status: :unprocessable_entity
    end
  end



  def update
    @appointment=Appointment.find(params[:id])
    if @appointment.update(params_appointment)
      render json: @appointment, status: :created, location: api_v1_appointment_path(@appointment)
    else
      render json: @appointment.errors, status: :unprocessable_entity
    end
  end

  def updateStatusAppointment
    @appointment=Appointment.find(params[:id])
    if @appointment.update(params_status)
      render json: @appointment, status: :created, location: api_v1_appointment_path(@appointment)
    else
      render json: @appointment.errors, status: :unprocessable_entity
    end
  end


  def destroy
    @appointment.destroy
  end

  private

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end


  def params_status
    params.require(:appointments).permit(:status)
  end
  def params_appointment
    params.require(:appointments).permit(:branch_office_id, :patient_id, :tutor_id, :status, :createdBy, appointment_details_attributes:[:id,:vaccine_id,:status,:createdBy])
  end
end
