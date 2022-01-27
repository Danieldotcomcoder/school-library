require './person'

class Main 

    
        puts "Please choose an option by entering a number:"
        puts "1- List all books"
        puts "2- List all people"
        puts "3- Create a person"
        puts "4- Create a book"
        puts "5- Create a rental"
        puts "6- List all rentals for a given person id"
        puts "7- Exit"


        input= gets.chomp()

        case input
        when 1 
            

        when 2 

        when 3
           puts "Do you want to create a student(1) or a teacher(2)? [Input the number]"

        when 4

        when 5

        when 6

        when 7
        end

    

end

def main
    app = Main.new()
    app.run()
  end