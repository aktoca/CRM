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
    puts "3. Remove"
    puts "4. Edit"
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
    puts "All Contacts"
    @rolodex.show_contacts
    puts "--------------"
  end

  def remove_contact
    puts "Remove"
    puts "Enter contact's ID to remove it"
    id = gets.chomp.to_i
    @rolodex.remove_contact(id)
  end

  def edit_contoct
    puts "Enter contact'- Id to edit_contoct"
    id = gets.chomp.to_i
    puts "ENter new contact name"
    new_name = gets.chomp
    @rolodex.edit__contact(id, new_name)
  end

  def run
    done = false
    # EXECUTION LOOP
    while !done
      main_menu
      input = gets.chomp.to_i
      if input == 0
        done = true
      elsif input == 1
        add_contact
      elsif input == 2
        show_contacts
      elsif input == 3
        remove_contact
      elsif input == 4
        edit_contact
      end
    end

  end
end

runner = Runner.new
runner.run