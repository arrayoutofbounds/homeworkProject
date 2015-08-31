json.array!(@homeworks) do |homework|
  json.extract! homework, :id, :title, :question, :duedate
  json.url homework_url(homework, format: :json)
end
