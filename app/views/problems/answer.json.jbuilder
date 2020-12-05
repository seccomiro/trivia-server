json.status :success
json.data do
  json.answer do
    json.status @problem.status
    json.correct_answer do
      json.partial! @problem.answers.correct, as: :answer
    end
    json.score @game.score
  end
end
