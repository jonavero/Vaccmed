class Api::V1::BranchOfficesController < ApplicationController
  #before_action :authenticate_user, only: [:create,:index,:show,:update]
  before_action :set_branchOffice, only: [:show]
  def index
    @branchOffices= if params[:search]
                      @count =BranchOffice.where('"name" ILIKE ?',"%#{params[:search]}%").count
                      BranchOffice.where('"name" ILIKE ?',"%#{params[:search]}%").paginate(:page => params[:skip], :per_page => params[:maxCount])
                    else
                      @count =BranchOffice.count
                      BranchOffice.paginate(:page => params[:skip], :per_page => params[:maxCount]).order(:id)
                    end

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
      @mensaje='Registro Creado'
      render 'mensaje',status: :created
    else
      render json: @branchOffice.errors,status:  :unprocessable_entity
    end
  end

  def update

    @mensaje='Id no especificado'
    if params[:branchOffice][:id]
      @center = BranchOffice.where('id=?',params[:branchOffice][:id])
      if @center.update(branchOffice_params)
        @mensaje='Registro Actualizado'
        render 'mensaje',status: :created
      else
        render json: @center.errors,status: :unprocessable_entity
      end
    else
      render 'mensaje',status: :unprocessable_entity
    end



  end

  private
  def set_branchOffice
    @branchOffice = BranchOffice.find(params[:id])
  end

  def branchOffice_params
    params.require(:branchOffice).permit(:id,:name,:address,:sector,:province,:status,:createBy)
  end
end
