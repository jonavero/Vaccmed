class Api::V1::VaccinesController < ApplicationController

  before_action :authenticate_user, only: [:create,:index,:show]
  before_action :set_vaccine, only: [:show,:update,:updateStatus]

  def index
    @count=Vaccine.count
  @vaccines= Vaccine.all
  end

  def show

  end

  def create
   @vaccine= Vaccine.new(vaccine_params)
    if @vaccine.save
      render json: @vaccine, status: :created,location: api_v1_vaccine_path(@vaccine)
    else
      render json: @vaccine.errors,status: :unprocessable_entity
    end

  end

  def update
    if @vaccine.update(vaccine_params)
      render json: @vaccine, status: :created,location: api_v1_vaccine_path(@vaccine)
    else
      render json: @vaccine.errors,status: :unprocessable_entity
    end
  end

  def updateStatus
    if @vaccine.update(status_params)
    render json: @vaccine, status: :created, location: api_v1_vaccine_path(@vaccine)
    else
    render json: @vaccine.errors, status: :unprocessable_entity
    end
  end

  private

  def set_vaccine
    @vaccine = Vaccine.find(params[:id])
  end

  def vaccine_params
    params.require(:vaccine).permit(:name,:description,:status,:dose,:typeDose,:createBy,:edadMinima,:edadMaxima)
  end

  def status_params
    params.require(:vaccine).permit(:status)
  end
end
