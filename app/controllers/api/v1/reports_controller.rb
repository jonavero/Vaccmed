class  Api::V1::ReportsController < ApplicationController

  def reportCenter
   @mensaje ='Parametros no suministrados'
    if params[:idCenter] !='' && params[:fechaInicio] && params[:fechafinal]  && params[:status] !=''
      @count = Appointment.where('branch_office_id=?  and status=? and created_at::date>= ? and created_at::date <= ?',params[:idCenter],params[:status],params[:fechaInicio],params[:fechafinal]).count
      @report = Appointment.where('branch_office_id=?  and status=? and created_at::date>= ? and created_at::date <= ?',params[:idCenter],params[:status],params[:fechaInicio],params[:fechafinal])

    elsif  params[:fechaInicio] && params[:fechafinal]  && params[:idCenter] !=''
      @count = Appointment.where('branch_office_id=?  and created_at::date>= ? and created_at::date <= ?',params[:idCenter],params[:fechaInicio],params[:fechafinal]).count
      @report = Appointment.where('branch_office_id=?  and created_at::date>= ? and created_at::date <= ?',params[:idCenter],params[:fechaInicio],params[:fechafinal])

    elsif  params[:fechaInicio] && params[:fechafinal]  && params[:status] !=''
      @count = Appointment.where('status=? and created_at::date>= ? and created_at::date <= ?',params[:status],params[:fechaInicio],params[:fechafinal]).count
      @report = Appointment.where('status=? and created_at::date>= ? and created_at::date <= ?',params[:status],params[:fechaInicio],params[:fechafinal])

    else
      @count = Appointment.where('created_at::date>= ? and created_at::date <= ?',params[:fechaInicio],params[:fechafinal]).count
      @report = Appointment.where('created_at::date>= ? and created_at::date <= ?',params[:fechaInicio],params[:fechafinal])
    end


  end

  def reportVaccine
    if params[:idCenter] !='' && params[:fechaInicio] && params[:fechafinal]  && params[:status] !=''

      @reportVaccine = AppointmentDetail.select('vaccines.name,count(vaccines.id) as Cantidad,vaccines.description,vaccines.dose,appointments.status,branch_offices.name as "center",appointments."appointmentDate"').
          joins('join vaccines on appointment_details.vaccine_id = vaccines.id
    join appointments on appointment_details.appointment_id = appointments.id
    join branch_offices on appointments.branch_office_id = branch_offices.id').group('vaccines.id ,appointments.status,branch_offices.name,appointments."appointmentDate"').
     where('appointments.status = ? and branch_offices.id=?  and appointments."appointmentDate" >=? and appointments."appointmentDate" <= ? ',params[:status],params[:idCenter],params[:fechaInicio],params[:fechafinal]).order('appointments."appointmentDate" ASC')

    elsif  params[:fechaInicio] && params[:fechafinal]  && params[:idCenter] !=''
      @reportVaccine = AppointmentDetail.select('vaccines.name,count(vaccines.id) as Cantidad,vaccines.description,vaccines.dose,appointments.status,branch_offices.name as "center",appointments."appointmentDate"').
          joins('join vaccines on appointment_details.vaccine_id = vaccines.id
    join appointments on appointment_details.appointment_id = appointments.id
    join branch_offices on appointments.branch_office_id = branch_offices.id').group('vaccines.id ,appointments.status,branch_offices.name,appointments."appointmentDate"').
          where('branch_offices.id=?  and appointments."appointmentDate" >=? and appointments."appointmentDate" <= ? ',params[:idCenter],params[:fechaInicio],params[:fechafinal]).order('appointments."appointmentDate" ASC')

    elsif  params[:fechaInicio] && params[:fechafinal]  && params[:status] !=''
      @reportVaccine = AppointmentDetail.select('vaccines.name,count(vaccines.id) as Cantidad,vaccines.description,vaccines.dose,appointments.status,branch_offices.name as "center",appointments."appointmentDate"').
          joins('join vaccines on appointment_details.vaccine_id = vaccines.id
    join appointments on appointment_details.appointment_id = appointments.id
    join branch_offices on appointments.branch_office_id = branch_offices.id').group('vaccines.id ,appointments.status,branch_offices.name,appointments."appointmentDate"').
          where('appointments.status = ?  and appointments."appointmentDate" >=? and appointments."appointmentDate" <= ? ',params[:status],params[:fechaInicio],params[:fechafinal]).order('appointments."appointmentDate" ASC')

    elsif  params[:fechaInicio] && params[:fechafinal]
      @reportVaccine = AppointmentDetail.select('vaccines.name,count(vaccines.id) as Cantidad,vaccines.description,vaccines.dose,appointments.status,branch_offices.name as "center",appointments."appointmentDate"').
          joins('join vaccines on appointment_details.vaccine_id = vaccines.id
    join appointments on appointment_details.appointment_id = appointments.id
    join branch_offices on appointments.branch_office_id = branch_offices.id').group('vaccines.id ,appointments.status,branch_offices.name,appointments."appointmentDate"').
          where('appointments."appointmentDate" >=? and appointments."appointmentDate" <= ? ',params[:fechaInicio],params[:fechafinal]).order('appointments."appointmentDate" ASC')

    else

      @reportVaccine = AppointmentDetail.select('vaccines.name,count(vaccines.id) as Cantidad,vaccines.description,vaccines.dose,appointments.status,branch_offices.name as "center",appointments."appointmentDate"').
          joins('join vaccines on appointment_details.vaccine_id = vaccines.id
    join appointments on appointment_details.appointment_id = appointments.id
    join branch_offices on appointments.branch_office_id = branch_offices.id').
          group('vaccines.id ,appointments.status,branch_offices.name,appointments."appointmentDate"').order('appointments."appointmentDate" ASC')
    end


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
