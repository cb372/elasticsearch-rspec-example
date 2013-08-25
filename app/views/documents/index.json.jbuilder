json.array!(@documents) do |document|
  json.extract! document, :body
  json.url document_url(document, format: :json)
end
