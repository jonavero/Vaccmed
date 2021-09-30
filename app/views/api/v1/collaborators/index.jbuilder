
json.totalCount @count
 json.collaborators @collaborators do |c|
json.id c.id
json.names c.names
json.surname c.surname
json.email c.email
json.centroId c.branch_office.id
json.centroName c.branch_office.name
json.role c.role.description
json.rolId c.role.id
json.status c.status
    end

