json.totalCount @count
json.tutors @tutors do |t|
  json.id t.id
  json.name t.name
  json.surname t.surname
  json.documentType t.documentType
  json.identityCard t.identityCard
  json.email t.email
  json.gender t.gender
  json.birthday t.birthday
  json.phone t.phone
  json.telephone t.telephone
  json.workTelephone t.workTelephone
  json.address t.address
  json.createDate t.created_at
  json.createdBy t.createdBy
end


