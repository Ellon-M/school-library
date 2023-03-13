require_relative './app/app'

class Main
  def start_console
    puts "School library app!\n\n"
    loop do
      list_of_options
      input = gets.chomp
    end

  def self.menu
    puts "Please choose an option by entering a number from the list:\n"

    @list = {
      '1' => 'List all books',
      '2' => 'List all people',
      '3' => 'Add a person',
      '4' => 'Add a book',
      '5' => 'Add a rental',
      '6' => 'List all rentals for a given person',
      '7' => "Exit\n\n"
    }

    @list.each do |index, string|
      puts "#{index} - #{string}"
    end
    gets.chomp
  end

  app = App.new

  loop do
    case menu
    when '1'
      app.list_books
    when '2'
      app.list_people
    when '3'
      app.add_person
    when '4'
      app.add_book
    when '5'
      app.add_rental
    when '6'
      app.list_rentals
    when '7'
      puts 'Bye!'
      exit
    else
      puts "Please choose a number that exists in the above list\n\n"
    end
  end
end

def initialize_app
  Main.new
end

initialize_app
