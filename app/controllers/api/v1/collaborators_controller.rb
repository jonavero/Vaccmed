class Api::V1::CollaboratorsController < ApplicationController

  before_action :authenticate_user, only: [:create,:index,:show,:update]
  before_action :set_collaborator, only: [:show,:update]

  def index

    @collaborators= if params[:search]
                      @count=  Colaborador.where('"names" ILIKE ?',"%#{params[:search]}%").count
               Colaborador.where('"names" ILIKE ?',"%#{params[:search]}%").paginate(:page => params[:skip], :per_page => 1)

                    else
                      @count= Colaborador.count
                     Colaborador.joins(:branch_office,:role).paginate(:page => params[:skip], :per_page => 1)
             end

  end

  def show
    @collaborator =Colaborador.joins(:branch_office,:role).find(params[:id])

   # @branchOffice= BranchOffice.select(Arel.star).where(Colaborador.arel_table[:id].eq(@collaborator.id)).joins(
       # BranchOffice.arel_table.join(Colaborador.arel_table).on(Colaborador.arel_table[:branch_office_id].eq(BranchOffice.arel_table[:id])).join_sources)
  end

  def create
    @collaborator =Colaborador.new(collaborator_params)

    if @collaborator.save
      render json: @collaborator, status: :created,location: api_v1_collaborator_path(@collaborator)
    else
      render json: params.inspect
    end
  end

  def update

    if @collaborator.update(collaborator_params)
      render json: @collaborator, status: :created,location: api_v1_collaborator_path(@collaborator)
    else
      render json: @collaborator.errors,status: :unprocessable_entity
    end
  end

  private

  def set_collaborator
    @collaborator = Colaborador.find(params[:id])
  end

  def collaborator_params
    params.require(:colaboradors).permit(:names,:surname,:status,:email,:address,:branch_office_id,:role_id,:createBy)
  end

end
