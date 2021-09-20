class Api::V1::TutorsController < ApplicationController
  before_action :set_tutor, only: [:show,:update]
  before_action :authenticate_user, only: [:create,:index,:show,:update]
  def index
    @tutors= if params[:search]
                      @count =Tutor.where('"name" ILIKE ?',"%#{params[:search]}%").count
                      Tutor.where('"name" ILIKE ?',"%#{params[:search]}%").paginate(:page => params[:skip], :per_page => params[:maxCount])
                    else
                      @count =Tutor.count
                      Tutor.paginate(:page => params[:skip], :per_page => params[:maxCount]).order(:id)
                    end
  end

  def show

  end

  def create

    @tutor= Tutor.new(tutors_params)
    if @tutor.save
      @mensaje='Registro creado'
      render 'mensaje',status: :created
    else
      render json: @tutor.errors,status:  :unprocessable_entity
    end
  end



  def update
    if @tutor.update(tutors_params)
      @mensaje='Registro actualizado'
      render 'mensaje',status: :created
    else
      render json: @tutor.errors,status:  :unprocessable_entity
    end
  end


  private

  def tutors_params
    params.require(:tutor).permit(:name,:surname,:email,:identityCard,:documentType,:phone,:telephone,:workTelephone,:gender,:birthday,:address,:createdBy)
  end

  def set_tutor
    @tutor= Tutor.find(params[:id])
  end

end
