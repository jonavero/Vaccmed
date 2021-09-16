json.data do
  json.id @current_user.id
  json.username @current_user.username
  json.name @current_user.colaborador.names
  json.email @current_user.email
  json.role @current_user.colaborador.role.description
  json.nameCenter @current_user.colaborador.branch_office.name


end