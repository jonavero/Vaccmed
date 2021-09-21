class Api::V1::AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show,:update,:destroy]
  def index
    @appointments = if params[:status]
                      @count= AppointmentDetail.joins(:appointment[:patient, :tutor]).where('"status" = ?',params[:status] )
                      AppointmentDetail.joins(:appointment[:patient, :tutor]).where('"status" = ?',params[:status] ).paginate(:page => params[:skip], :per_page => params[:maxCount])
                    else
                      @count =Appointment.count
                      Appointment.joins(:patient,:tutor ).paginate(:page => params[:skip], :per_page => params[:maxCount])
                    end
  end

  def show
  end

  def create
     # @appointment= Appointment.new
     # @appointment.appointment_details.build
      @appointment =Appointment.new(params_appointment)
    if @appointment.save
      render json: @appointment, status: :created, location: api_v1_appointment_path(@appointment)
    else
      render json: @appointment.errors, status: :unprocessable_entity
    end
  end

  def update

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
