
json.object do

    json.id @collaborator.id
    json.names @collaborator.names
    json.surname @collaborator.surname
    json.email @collaborator.email
    json.centroName @collaborator.branch_office.name
    json.role @collaborator.role.description
    json.status @collaborator.status

end