class Api::V1::BranchOfficesController < ApplicationController
 # before_action :authenticate_user, only: [:create,:index,:show,:update]
  before_action :set_branchOffice, only: [:show,:update]
  def index
    @branchOffices=BranchOffice.all
    render json: @branchOffices
  end

  def show
    render json: @branchOffice
  end

  def showByStatus
    @branchOffice = BranchOffice.where(:status =>'Active').order(:id)
    render json: @branchOffice.as_json(only: %i(id name))

  end

  def create
    @branchOffice = BranchOffice.new(branchOffice_params)
    if @branchOffice.save
      render json: @branchOffice, status: :created, location: api_v1_branch_office_path(@branchOffice)
    else
      render json: @branchOffice.errors,status:  :unprocessable_entity
    end
  end

  def update
    if @branchOffice.update(branchOffice_params)
      render json: @branchOffice, status: :created,location: api_v1_branch_office_path(@branchOffice)
    else

      render json: @branchOffice.errors,status: :unprocessable_entity
    end
  end

  private
  def set_branchOffice
    @branchOffice = BranchOffice.find(params[:id])
  end

  def branchOffice_params
    params.require(:branch_office).permit(:name,:address,:sector,:province,:state,:status,:createBy)
  end
end
