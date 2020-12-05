json.status :success
json.data do
  json.ranking do
    json.array! @games do |game|
      json.email game.user.email
      json.score game.score
    end
  end
end
