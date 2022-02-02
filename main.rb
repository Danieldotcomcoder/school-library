require './methods'

class App
  def initialize
    @methods = Methods.new
    @list = {
      '1' => 'List all books',
      '2' => 'List all people',
      '3' => 'Create a person',
      '4' => 'Create a book',
      '5' => 'Create a rental',
      '6' => 'List all rentals for a given person id',
      '7' => 'Exit'
    }.freeze
  end

  def run
    puts 'Please choose an option by entering a number:'
    loop do
      @list.each do |key, value|
        puts "#{key} - #{value}"
      end
      input = gets.chomp.to_i
      if input == 7
        @methods.save_data
        puts 'Thanks for using our app'
        break
      end
      @methods.list input
    end
  end
end

def main
  app = App.new
  app.run
end

main
