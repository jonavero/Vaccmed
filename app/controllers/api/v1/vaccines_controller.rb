class Api::V1::VaccinesController < ApplicationController

  before_action :authenticate_user, only: [:create,:index,:show]
  before_action :set_vaccine, only: [:index,:show,:create,:update,:updateStatus]

  def index

  end

  def show

  end

  def create

  end

  def update

  end

  def updateStatus

  end

  private

  def set_vaccine
    @vaccine = Vaccine.find(params[:id])
  end

  def vaccine_params
    params.require(:vaccine).permit(:description,:status,:dose,:typeDose,:createBy,:edadMinima,:edadMaxima)
  end
end
