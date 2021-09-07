json.data do

    json.id @collaborator.id
    json.names @collaborator.names
    json.surname @collaborator.surname
    json.status @collaborator.status
    json.email @collaborator.email
    json.address @collaborator.address
    json.createBy @collaborator.createBy
    json.createdDate @collaborator.created_at
    json.user @branchOffice do |branch|

          json.name branch.name

    end

  end

