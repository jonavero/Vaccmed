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

  private
  def depents_params
    params.require(:dependent).permit(:patientId,:tutorId,:relationshipId, :createdBy)
  end
end
