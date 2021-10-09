json.countComplete @countComplete
json.countPending  @countPending
time= Time.now.utc - 14400
json.time time.strftime("%d-%m-%Y")
json.zone time.zone.to_s