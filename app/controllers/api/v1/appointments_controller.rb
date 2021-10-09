class Api::V1::AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show,:update,:destroy]
  def index
    @appointments = if params[:status] !=''
                      @count=  Appointment.joins(:patient,:tutor,:appointment_details ).where('appointments.status = ?' ,params[:status] ).uniq.count
                      Appointment.joins(:patient,:tutor,:appointment_details ).where('appointments.status = ?',params[:status] ).paginate(:page => params[:skip], :per_page => params[:maxCount]).order(:id).uniq
                    else
                      @count =Appointment.count
                      Appointment.paginate(:page => params[:skip], :per_page => params[:maxCount]).order('appointments.id').uniq
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
    @tutor=Tutor.find_by(:user_id =>params[:userId])
    @mensaje="ID Tutor no especificado"
      if params[:search] !='' || params[:status] !=''
        @count= Appointment.joins(:tutor,:patient).where('"tutor_id" = ? and "status"=?', @tutor.id,params[:status]).count

        @appointments = Appointment.joins(:tutor,:patient).where('"tutor_id" = ? and "status"=?', @tutor.id,params[:status]).paginate(:page => params[:skip], :per_page => params[:maxCount]).order(:id)
      else
        @count= Appointment.joins(:tutor,:patient).where('tutor_id = ?', @tutor.id).count
        @appointments = Appointment.joins(:tutor,:patient).where('tutor_id = ?', @tutor.id).paginate(:page => params[:skip], :per_page => params[:maxCount]).order(:id)
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

    @mensaje='Id no especificado'
    if params[:appointments][:id]
      @appointment = Appointment.where('id=?',params[:appointments][:id])
      if @appointment.update(params_appointment)
        @mensaje='Registro Actualizado'
        render 'mensaje',status: :created
      else
        render json: @appointment.errors,status: :unprocessable_entity
      end
    else
      render 'mensaje',status: :unprocessable_entity
    end


  end


  def updateGeneral

    @mensaje='Id no especificado'
    if params[:appointments][:id]
      @appointment = Appointment.where('id=?',params[:appointments][:id])
      @detail_appointment = AppointmentDetail.where('appointment_id=?',params[:appointments][:id])
      @detail_appointment.destroy_all
          if @appointment.update(params_appointment_general)
        @mensaje='Registro Actualizado'
        render 'mensaje',status: :created
      else
        render json: @appointment.errors,status: :unprocessable_entity
      end
    else
      render 'mensaje',status: :unprocessable_entity
    end


  end


  def updateStatusAppointment
    @mensaje='Id no especificado'
    if params[:appointments][:id]
      @appointment = Appointment.where('id=?',params[:appointments][:id])
      if @appointment.update(params_status)
        @mensaje='Registro Actualizado'
        render 'mensaje',status: :created
      else
        render json: @appointment.errors,status: :unprocessable_entity
      end
    else
      render 'mensaje',status: :unprocessable_entity
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
    params.require(:appointments).permit(:id,:status)
  end
  def params_appointment
    params.require(:appointments).permit(:id,:branchOfficeId, :patientId, :tutorId,:appointmentDate, :status, :createdBy, appointmentDetailsAttributes:[:id,:vaccineId,:status,:createdBy])
  end


  def params_appointment_general
    params.require(:appointments).permit(:id,:appointmentDate, appointmentDetailsAttributes:[:id,:vaccineId,:status,:createdBy])
  end
end
