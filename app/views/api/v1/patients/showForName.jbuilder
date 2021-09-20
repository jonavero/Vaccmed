json.listPatient @patientsName do |p|
  json.id p.id
  json.name p.name
  json.surname p.surname
  json.gender p.gender
  json.birthday p.birthday
end