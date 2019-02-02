json.extract! book, :id, :url, :name, :file, :created_at, :updated_at
json.url book_url(book, format: :json)
