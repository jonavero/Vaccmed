class Api::V1::CollaboratorsController < ApplicationController

  before_action :authenticate_user, only: [:create,:index,:show,:update]
  before_action :set_collaborator, only: [:show,:update]

  def index
    @count= Colaborador.count
    @collaborators= Colaborador.joins(:branch_office)

  end

  def show
    @collaborator =Colaborador.find(params[:id])
    @branchOffice= BranchOffice.select(Arel.star).where(Colaborador.arel_table[:id].eq(@collaborator.id)).joins(
        BranchOffice.arel_table.join(Colaborador.arel_table).on(Colaborador.arel_table[:branch_office_id].eq(BranchOffice.arel_table[:id])).join_sources)
  end

  def create
    @collaborator =Colaborador.new(collaborator_params)

    if @collaborator.save
      render json: @collaborator, status: :created,location: @collaborator
    else
      render json: params.inspect
    end
  end

  def update

    if @collaborator.update(collaborator_params)
      render json: @collaborator, status: :created,location: @collaborator
    else
      render json: @collaborator.errors,status: :unprocessable_entity
    end
  end

  private

  def set_collaborator
    @collaborator = Colaborador.find(params[:id])
  end

  def collaborator_params
    params.require(:colaboradors).permit(:names,:surname,:status,:email,:address,:branch_office_id,:createBy)
  end

end
