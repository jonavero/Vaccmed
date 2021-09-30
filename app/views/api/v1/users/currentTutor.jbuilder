json.user do
  json.id @current.id
  json.username @current.username
  json.name @current.name
  json.surname @current.surname
  json.email @current.email
  json.role @current.user.role.description
end
