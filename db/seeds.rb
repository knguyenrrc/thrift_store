require "csv"
require "rest-client"
require "json"

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

subjects = Subject.all

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

publishers = Publisher.all

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
    book = author.books.create(title: b["title"], pages: Faker::Number.number(digits: 3), price: Faker::Number.decimal(l_digits: 3, r_digits: 2))

    # subjects.each do |subject|
    random_subject = rand(3..5)

    random_subject.times do
      BookSubject.create(book: book, subject: Subject.random_records(1).take)
    end

    random_publisher = rand(5..8)

    random_publisher.times do
      BookPublisher.create(book: book, publisher: Publisher.random_records(1).take)
    end

  end
end
