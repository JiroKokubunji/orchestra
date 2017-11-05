json.extract! preprocess, :id, :created_at, :updated_at
json.url preprocess_url(preprocess, format: :json)
