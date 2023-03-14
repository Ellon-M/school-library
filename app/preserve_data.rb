require 'json'

def open_file(directory, file_name)
  File.new(directory, 'w') unless File.exist?(directory)
  File.open(directory, 'w') do |file|
    file.puts(JSON.pretty_generate(file_name))
  end
end

def read_person
  if File.exist?('../data/people.json')
    File.open('../data/people.json', 'r') do |file|
      people = JSON.parse(file.read)
      people.each do |person|
        @persons << if person['occupation'] == 'Student'
                      Student.new(age: person['age'], name: person['name'], parent_permission: person['parent_permission'])
                    else
                      Teacher.new(person['specialization'], person['age'], person['name'])
                    end
      end
    end
  else
    []
  end
end

def save_person
  people = @persons.map do |person|
    if person.instance_of?(Student)
      {
        occupation: 'Student',
        name: person.name,
        age: person.age,
        specialization: person.specialization
      }
    else
      {
        occupation: 'Teacher',
        name: person.name,
        age: person.age,
        parent_permission: person.parent_permission
      }
    end
  end
  open_file('../data/people.json', people)
end

def read_books
  if File.exist?('../data/books.json')
    File.open('../data/books.json', 'r') do |file|
      books = JSON.parse(file.read)
      books.each do |book|
        @books << Book.new(book['title'], book['author'])
      end
    end
  else
    []
  end
end

def save_books
  book_store = @books.map do |book|
    {
      title: book.title,
      author: book.author
    }
  end
  File.new('./data/books.json', 'w') unless File.exist?('./data/books.json')
  File.open('./data/books.json', 'w') do |file|
    file.puts(JSON.pretty_generate(book_store))
  end
end
