json.array!(@poems) do |poem|
  json.extract! poem, :id, :title, :body, :poet_id
  json.url poem_url(poem, format: :json)
end
