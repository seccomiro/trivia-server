json.extract! problem, :id, :question, :difficulty
json.category do
  json.partial! problem.category, as: :category
end
json.answers do
  json.array! problem.answers, partial: 'answers/answer', as: :answer
end
