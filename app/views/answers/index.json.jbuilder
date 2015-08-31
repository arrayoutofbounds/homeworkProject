json.array!(@answers) do |answer|
  json.extract! answer, :id, :User_id, :Homework_id, :body
  json.url answer_url(answer, format: :json)
end
