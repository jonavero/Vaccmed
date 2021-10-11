class  Api::V1::ReportsController < ApplicationController

  def reportCenter
   @mensaje ='Parametros no suministrados'
    if params[:idCenter] !='' && params[:fechaInicio] && params[:fechafinal]  && params[:status] !=''
      @count = Appointment.where('branch_office_id=?  and status=? and created_at::date>= ? and created_at::date <= ?',params[:idCenter],params[:status],params[:fechaInicio],params[:fechafinal]).count
      @report = Appointment.where('branch_office_id=?  and status=? and created_at::date>= ? and created_at::date <= ?',params[:idCenter],params[:status],params[:fechaInicio],params[:fechafinal])

    elsif  params[:fechaInicio] && params[:fechafinal]  && params[:status] !=''
      @count = Appointment.where('status=? and created_at::date>= ? and created_at::date <= ?',params[:status],params[:fechaInicio],params[:fechafinal]).count
      @report = Appointment.where('status=? and created_at::date>= ? and created_at::date <= ?',params[:status],params[:fechaInicio],params[:fechafinal])
    else
      @count = Appointment.where('created_at::date>= ? and created_at::date <= ?',params[:fechaInicio],params[:fechafinal]).count
      @report = Appointment.where('created_at::date>= ? and created_at::date <= ?',params[:fechaInicio],params[:fechafinal])
    end


  end

  def reportVaccine
    @reportVaccine = Appointment.joins(:appointment_details).where('appointments.appointmentDate= ? and appointment_details.=?', @tutor.id,params[:status])
  end

  def reportAge

    if  params[:fechaInicio] !='' && params[:fechafinal] !='' and params[:age]
      @age=params[:age].to_time
      @patient = Patient.where('birthday =?',@age)
    else
      @patient = Patient.where('birthday <?',@age)
    end
  end

end
