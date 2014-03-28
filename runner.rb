require './rolodex'
require './contact'


#user interface
class Runner
  def initialize #creates Rolodex
    @rolodex = Rolodex.new
  end

  def main_menu
    puts "Amazing CRM"
    puts "1. Add a contact"
    puts "2. See all contacts"
    puts "0. To Exit"
  end

  def add_contact
    puts "Enter Customer's Name"
    name = gets.chomp
    #we want the rolodex to create
    # we dont want dependency to data
    @rolodex.create_contact(name)
  end

  def show_contacts
    @rolodex.show_contacts
  end

  def run
    done = false
    # EXECUTION LOOP
    while !done
      main_menu
      input = gets.chomp.to_i
      if input = 0
        done = true
      elsif input == 1
        add_contact
      elsif input == 2
        show_contacts
      end
    end

  end
end

runner = Runner.new
runner.run