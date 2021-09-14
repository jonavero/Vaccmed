json.object do


    json.id @user.id
    json.username @user.username
    json.emailil @user.email
    json.collaboratorNames @user.colaborador.names
    json.collaboratorSurname @user.colaborador.surname
    json.createdBy @user.createBy
    json.createdAt @user.created_at

end