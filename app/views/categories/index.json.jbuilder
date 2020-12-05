json.status :success
json.data do
  json.categories do
    json.array! @categories, partial: 'categories/category', as: :category
  end
end
