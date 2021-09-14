
 json.totalColaborators @count
  json.collaborators @collaborators do |c|
json.id c.id
json.names c.names
json.surname c.surname
json.email c.email
json.centroName c.branch_office.name
json.role c.role.description
json.status c.status
    end

