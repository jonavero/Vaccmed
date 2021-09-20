class  Api::V1::RelationshipsController < ApplicationController
  def index
    @relations = Relationship.all.order(:name)
  end

  def create
    @relation= Relationship.new(relations_params)
    if @relation.save
      @mensaje='Registro Creado'
      render 'mensaje',status: :created
    else
      render json: @relation.errors,status:  :unprocessable_entity
    end
  end

  private

  def relations_params
    params.require(:relationship).permit(:name,:createdBy)
  end

end
