class Api::V1::TutorsController < ApplicationController
  before_action :set_tutor, only: [:show]
 # before_action :authenticate_user, only: [:create,:index,:show,:update,:tutorDepend]
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



  def tutorDepend
    @mensaje="ID del tutor no especificado"
    @tutorDepend = if params[:id]
                     Dependent.joins(:patient, :tutor).where('"tutor_id" = ?',params[:id] )
                   else
                  render 'mensaje'
                   end

  end

  def turn
    @mensaje="Cedula no especificada"
    if params[:identityCard]
    @tutor=Tutor.find_by(:identityCard => params[:identityCard])
    @turn = Appointment.joins(:tutor,:patient).where('tutor_id=? and status=?',@tutor.id,"Pendiente").order(:id)
    else
      render 'mensaje'
    end
  end

  def create
    @tutor= Tutor.new(tutors_params)
    if @tutor.save
      render json: @tutor, status: :created,location: api_v1_tutor_path(@tutor)
    else
      render json: @tutor.errors,status:  :unprocessable_entity
    end
  end



  def update

    @mensaje='Id no especificado'
    if params[:tutor][:id]
      @tutor = Tutor.where('id=?',params[:tutor][:id])
      if @tutor.update(vaccine_params)
        @mensaje='Registro Actualizado'
        render 'mensaje',status: :created
      else
        render json: @tutor.errors,status: :unprocessable_entity
      end
    else
      render 'mensaje',status: :unprocessable_entity
    end


  end


  private

  def tutors_params
    params.require(:tutor).permit(:id,:name,:surname,:email,:identityCard,:documentType,:phone,:telephone,:workTelephone,:gender,:birthday,:address,:createdBy)
  end

  def set_tutor
    @tutor= Tutor.find(params[:id])
  end

end
