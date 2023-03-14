require 'json'

def open_file(directory, file_name)
  File.new(directory, 'w') unless File.exist?(directory)
  File.open(directory, 'w') do |file|
    file.puts(JSON.pretty_generate(file_name))
  end
end

def read_person
  if File.exist?('data/people.json')
    File.open('data/people.json', 'r') do |file|
      people = JSON.parse(file.read)
      people.each do |person|
        @people << if person['occupation'] == 'Student'
                     Student.new(person['name'], person['age'], person['classroom'], person['parent_permission'])
                   else
                     Teacher.new(person['age'], person['specialization'], person['name'], person['parent_permission'])
                   end
      end
    end
  else
    []
  end
end

def save_person
  people = @people.map do |person|
    if person.instance_of?(Student)
      {
        occupation: 'Student',
        name: person.name,
        age: person.age,
        classroom: person.classroom,
        parent_permission: person.parent_permission
      }
    else
      {
        occupation: 'Teacher',
        name: person.name,
        age: person.age,
        specialization: person.specialization,
        parent_permission: person.parent_permission
      }
    end
  end
  open_file('data/people.json', people)
end

def read_books
  if File.exist?('data/books.json')
    File.open('data/books.json', 'r') do |file|
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
  books = @books.map do |book|
    {
      title: book.title,
      author: book.author
    }
  end
  open_file('data/books.json', books)
end

def read_rentals
  if File.exist?('data/rentals.json')
    File.open('data/rentals.json', 'r') do |file|
      rentals = JSON.parse(file.read)
      rentals.each do |rental|
        @rentals << Rental.new(rental['date'], @persons[rental['person_id']], @books[rental['book_id']])
      end
    end
  else
    []
  end
end

def save_rentals
  rentals = @rentals.map do |rental|
    {
      date: rental.date,
      person_id: @people.index(rental.person),
      book_id: @books.index(rental.book)
    }
  end
  open_file('data/rentals.json', rentals)
end
