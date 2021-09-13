class Api::V1::RolesController < ApplicationController
   before_action :authenticate_user, only: [:create,:index,:show]
   before_action :set_role, only: [:show]
  def index
    @roles = Role.all.order(:id)
    render json: @roles.as_json(only: %i(id description))
  end

  def show
    render json: @role
  end


  def create
    @role = Role.new(role_params)
    if @role.save
      render json: @role, status: :created, location: api_v1_role_path(@role)
    else
      render json: @role.errors,status:  :unprocessable_entity
    end
  end


  private
   def set_role
     @role = Role.find(params[:id])
   end

  def role_params
    params.require(:role).permit(:description,:createBy)
  end
end
