  json.totalCenter @count
  json.centers @branchOffices do |b|
    json.id b.id
    json.name b.name
    json.address b.address
    json.sector b.sector
    json.province b.province
    json.state b.state
    json.status b.status
    json.createDate b.created_at.strftime("%d-%m-%Y")
    json.createBy b.createBy
  end


