class Api::V1::DependetsController < ApplicationController

  def create
  @dependent =Dependent.new(depents_params)
   if @dependent.save
     @mensaje='Registro Creado'
     render 'mensaje',status: :created
   else
     render json: @dependent.errors,status:  :unprocessable_entity
   end
  end

  def update
    @mensaje='Id no especificado'
    if params[:dependent][:id]
      @dependent = Dependent.where('id=?',params[:dependent][:id])
      if @dependent.update(params_appointment)
        @mensaje='Registro Actualizado'
        render 'mensaje',status: :created
      else
        render json: @dependent.errors,status: :unprocessable_entity
      end
    else
      render 'mensaje',status: :unprocessable_entity
    end

  end


  def delete
    @mensaje='Paciente y tutor tienen citas relacionadas'
    if params[:idTutor] && params[:idPatient]
      @dependent= Dependent.where('patient_id=? and tutor_id=?',params[:idPatient],params[:idTutor])
      if Appointment.where('patient_id=? and tutor_id=?',params[:idPatient],params[:idTutor]).count >0
        render 'mensaje',status: :unprocessable_entity
      else
        @dependent.destroy_all
        @mensaje='Registro eliminado'
        render 'mensaje',status: :created
      end
    else
      @mensaje='Parametro Paciente y Tutor no especificados'
      render 'mensaje',status: :unprocessable_entity

    end
  end

  private
  def depents_params
    params.require(:dependent).permit(:patientId,:tutorId,:relationshipId, :createdBy)
  end
end
