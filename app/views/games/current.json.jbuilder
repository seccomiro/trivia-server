json.status :success
json.data do
  json.game do
    json.status @game.status
    json.started_at @game.created_at
    json.score @game.score
  end
end
