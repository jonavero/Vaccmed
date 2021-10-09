class  Api::V1::ReportsController < ApplicationController

  def reportCenter
@mensaje ='Parametros no suministrados'
    if params[:idCenter] && params[:fechaInicio] && params[:fechafinal]
      @report = Appointment.where('branch_office_id=? and created_at>= ? and created_at <= ?',params[:idCenter],params[:fechaInicio],params[:fechafinal])
    else
      render 'mensaje'
    end


  end

  def reportVaccine
    @reportVaccine = Appointment.joins(:appointment_details).where('appointments.appointmentDate= ? and appointment_details.=?', @tutor.id,params[:status])
  end

end
