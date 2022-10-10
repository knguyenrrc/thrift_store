require "csv"
require "rest-client"
require "json"

filename = Rails.root.join("db/authors.csv")

csv_data = File.read(filename)
authors = CSV.parse(csv_data, headers:true, encoding: "utf-8")

authors.each do |a|
  author_url = "https://openlibrary.org" + a["key"] + "/works.json"

  result = RestClient.get(author_url)

end

