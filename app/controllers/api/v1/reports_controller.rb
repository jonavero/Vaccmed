class  Api::V1::ReportsController < ApplicationController

  def reportCenter
   @mensaje ='Parametros no suministrados'
    if params[:idCenter] && params[:fechaInicio] && params[:fechafinal] && params[:sexo] && params[:status]
      @report = Appointment.where('branch_office_id=? and created_at>= ? and created_at <= ?',params[:idCenter],params[:fechaInicio],params[:fechafinal])
    else
      @report = Appointment.where('created_at>= ? and created_at <= ?',params[:fechaInicio],params[:fechafinal])
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
