require './system'
require './info'

class Menu
  
  def initialize()
     @system = System.new
  end

  def contact_info
    puts "first name, last name, email, notes"
    "John"
  end


  def main_menu
    puts "---------\nMain Menu\n---------"
    puts "1. Add a Contact"
    puts "2. Modify a Contact"
    puts "3. Display All Contacts"
    puts "4. Display One Contact"
    puts "5. Dispaly Contacts by Attribute"
    puts "6. Delete a Contact"
    puts "7. Exit"
    puts "---------"
  end

  def add_contact
    puts "Add a Contact"
    puts "please enter contact information"
    input = contact_info
    @system.add_contact(input)
  end

  def run
    done = false
    while !done
      main_menu
      print "\n>> " 
      input = gets.chomp.to_i
      if input == 1
        add_contact
      elsif input == 7
        done = true
      end
    end
  end

end

menu = Menu.new
menu.run

# 1. menu prompt
#   a. 'add' 
#       Prompt:
#         first name'
#         'last name'
#         'email'
#         'notes'
#   b. 'modify'
#       Prompt:
#         enter a contact attribute to be modified
#         'yes' or 'no' to confirm my selection
#           yes = prompted to change ''id', 'firstname', 'lastname' and 'email'
#             enter a new value for the attribute
#           no = return to menu
#   c. 'display all' 
#        shown all of the contacts that exist
#   d. 'display contact'
#       shown a particular contact
#   e. display attribute' 
#       prompted to enter an attribute 
#       show all of the contacts according to that attribute.
#   f. 'delete'
#       prompted to enter an attribute value
#   g. 'exit'
#       exit program

