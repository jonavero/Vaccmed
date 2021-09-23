class Api::V1::AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show,:update,:destroy]
  def index
    @appointments = if params[:status]
                      @count=  Appointment.joins(:patient,:tutor,:appointment_details ).where('"appointment.status" = ?',params[:status] ).count
                      Appointment.joins(:patient,:tutor,:appointment_details ).where('"status" = ?',params[:status] ).paginate(:page => params[:skip], :per_page => params[:maxCount])
                    else
                      @count =Appointment.count
                      Appointment.joins(:patient,:tutor,:appointment_details ).paginate(:page => params[:skip], :per_page => params[:maxCount]).uniq
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
    @appointment =Appointment.joins(:patient,:tutor,:appointment_details).find_by('"patient_id"=?',params[:idPatient])
      @detail_appointment =AppointmentDetail.where('"appointment_id"= ?',@appointment.id)
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

  def destroy
    @appointment.destroy
  end

  private

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  def params_appointment
    params.require(:appointments).permit(:branch_office_id, :patient_id, :tutor_id, :status, :createdBy, appointment_details_attributes:[:id,:vaccine_id,:status,:createdBy])
  end
end
