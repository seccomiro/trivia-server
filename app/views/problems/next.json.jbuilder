json.status :success
json.data do
  json.problem do
    json.partial! @problem, as: :problem
  end
end
