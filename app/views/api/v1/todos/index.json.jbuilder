json.array! @todos do |todo|
  json.extract! todo, :id, :name, :priority, :done
end
