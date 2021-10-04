json.totalCount @count
json.listDependents @dependents do|d|
  json.id d.patient.id
  json.name d.patient.name
  json.surname d.patient.surname
  json.gender d.patient.gender
  json.birthday d.patient.birthday

end