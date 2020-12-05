json.status :success
json.data do
  json.ranking do
    json.array! @games do |game|
      json.user game.user.name
      json.score game.score
    end
  end
end
