require "csv"
require "rest-client"
require "json"

filename = Rails.root.join("db/authors.csv")

csv_data = File.read(filename)
authors = CSV.parse(csv_data, headers:true, encoding: "utf-8")

authors.each do |a|
  author_url = "https://openlibrary.org" + a["key"] + ".json"

  author_result = JSON.parse(RestClient.get(author_url))

  author = Author.create(name: author_result["name"])

  book_url = "https://openlibrary.org/search.json?author="
  book_results = JSON.parse(RestClient.get(book_url + author_result["name"]))

  book_results["docs"].each do |b|
    author.books.create(title: b["title"], pages: Faker::Number.number(digits: 3), price: Faker::Number.decimal(l_digits: 3, r_digits: 2))
  end
end

Subject.create(name: "Arts")
Subject.create(name: "Animals")
Subject.create(name: "Fiction")
Subject.create(name: "Science & Mathematics")
Subject.create(name: "Business & Finance")
Subject.create(name: "Children's")
Subject.create(name: "History")
Subject.create(name: "Health & Wellness")
Subject.create(name: "Biography")
Subject.create(name: "Social Sciences")
Subject.create(name: "Places")
Subject.create(name: "Textbooks")

random_book_subject = rand(100..150)

random_book_subject.times do
  BookSubject.create(book_id: rand(1..931), subject_id: rand(1..12))
end

Publisher.create(name: "Houghton Mifflin Harcourt")
Publisher.create(name: "Allen & Unwin")
Publisher.create(name: "Mariner Books")
Publisher.create(name: "Minotauro")
Publisher.create(name: "SFBC")
Publisher.create(name: "Christian Bourgois")
Publisher.create(name: "Unwin Paperbacks")
Publisher.create(name: "MUZA")
Publisher.create(name: "Sushi Books")
Publisher.create(name: "Azbuka Klassika")
Publisher.create(name: "HarperCollins Publishers Ltd")
Publisher.create(name: "Collins")
Publisher.create(name: "BBC Books")
Publisher.create(name: "Presse Pocket")
Publisher.create(name: "French & European Pubns")

random_book_publisher = rand(200..350)

random_book_publisher.times do
  BookPublisher.create(book_id: rand(1..931), publisher_id: rand(1..15))
end