json.status :success
json.data do
  json.game do
    json.id @game.id
    json.status @game.status
    json.started_at @game.created_at
  end
end
