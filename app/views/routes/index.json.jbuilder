json.status :success
json.data do
  json.routes do
    json.array! @routes do |route|
      json.description route[:description]
      json.method route[:method]
      json.url route[:url]
    end
  end
end
