
json.totalCount @count
json.patients @patients do |p|
json.id p.id
json.identityCard p.identityCard
json.name p.name
json.surname p.surname
json.gender p.gender
json.birthday p.birthday
json.createdBy p.createdBy
json.createdDate p.created_at.strftime("%d-%m-%Y")
end

