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


  def tutorDepentList
    @tutor=Tutor.find_by(:user_id =>params[:userId])
    @dependents= if params[:search] !=''

               @count =Dependent.joins(:patient).where('tutor_id=? and patients.name ILIKE ? ',@tutor.id,"%#{params[:search]}%").count
                Dependent.joins(:patient).where('tutor_id=? and patients.name ILIKE ? ',@tutor.id,"%#{params[:search]}%").paginate(:page => params[:skip], :per_page => params[:maxCount])

             else
               @count =Dependent.where('tutor_id=?',@tutor.id).count
               Dependent.where('tutor_id=?',@tutor.id).paginate(:page => params[:skip], :per_page => params[:maxCount]).order(:id)
             end
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
    time= Time.now.utc - 14400
    @mensaje="Cedula no especificada"
    if params[:identityCard] and params[:centerId].present?

    if  @tutor=Tutor.find_by(:identityCard => params[:identityCard])
     @turn = Appointment.joins(:tutor,:patient).where('tutor_id=? and status=? and branch_office_id=? and "appointmentDate" = ?',@tutor.id,"Creada",params[:centerId],time.strftime("%Y-%m-%d")).order(:id)
    else
     @mensaje="Cedula no encontrada"
     render 'mensaje',status:  :unprocessable_entity
    end
    else
      render 'mensaje',status:  :unprocessable_entity
    end
  end

  def create

    @password=[*('a'..'z'),*('0'..'9')].shuffle[0,8].join
    @mensaje='Usuario no creado'
    @user = User.create(:username=>params[:tutor][:name]+params[:tutor][:identityCard],:email=>params[:tutor][:email],:password=>@password,:password_confirmation=>@password,:createBy=>'jonacas',:role_id=>5)
    params[:tutor][:user_id]= @user.id
    if @user.save
      UserSignupMailer.send_signup_email(@user).deliver


      @tutor= Tutor.new(tutors_params)
      if @tutor.save
        render json: @tutor, status: :created,location: api_v1_tutor_path(@tutor)
      else
        render json: @tutor.errors,status:  :unprocessable_entity
      end
    else
      @mensaje='Correo ya existen'
      render 'mensaje',status:  :unprocessable_entity
    end

  end



  def update

    @mensaje='Id no especificado'
    if params[:tutor][:id]
      @tutor = Tutor.where('id=?',params[:tutor][:id])
      if @tutor.update(tutors_params)
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
    params.require(:tutor).permit(:id,:name,:surname,:email,:identityCard,:documentType,:phone,:telephone,:workTelephone,:gender,:birthday,:address,:createdBy,:user_id)
  end

  def set_tutor
    @tutor= Tutor.find(params[:id])
  end

end
