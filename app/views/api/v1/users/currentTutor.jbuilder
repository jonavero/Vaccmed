json.user do
  json.id @current.user.id
  json.username @current.user.username
  json.name @current.name
  json.surname @current.surname
  json.email @current.email
  json.role @current.user.role.description
end
