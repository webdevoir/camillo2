json.extract! question, :id, :content, :notes, :created_at, :updated_at
json.url question_url(question, format: :json)