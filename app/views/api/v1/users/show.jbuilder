json.object do
  json.user @user do |u|

    json.id u.id
    json.username u.username
    json.emailil u.email
    json.collaboratorNames u.colaborador.names
    json.collaboratorSurname u.colaborador.surname
    json.role u.role.description
    json.createdBy u.createBy
    json.createdAt u.created_at

  end
end