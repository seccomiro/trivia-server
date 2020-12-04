json.extract! problem, :id, :question
json.answers do
  json.array! problem.answers, partial: 'answers/answer', as: :answer
end
