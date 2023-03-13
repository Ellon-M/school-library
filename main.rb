require_relative './app/app'

class Main
  def initialize
    @app = App.new
  end

  def start_console
    puts "School library app!\n\n"
    puts "Please choose an option by entering a number from the list:\n"
    loop do
      list_of_options
      input = gets.chomp
      if input == '7'
        puts 'Thanks for using the app!'
        break
      end
      option(input)
    end
  end

  def list_of_options
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Add a person'
    puts '4 - Add a book'
    puts '5 - Add a rental'
    puts '6 - List all rentals for a given person'
    puts "7 - Exit\n\n"
  end

  def option(input)
    case input
    when '1'
      @app.list_books
    when '2'
      @app.list_people
    when '3'
      @app.add_person
    when '4'
      @app.add_book
    when '5'
      @app.add_rental
    when '6'
      @app.list_rentals
    else
      puts 'Please choose a number that exists in the above list\n\n'
    end
  end
end

def initialize_app
  main = Main.new
  main.start_console
end

initialize_app
