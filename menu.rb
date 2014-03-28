require './system'
require './info'

class Menu
  INFO = ["First Name", "Last Name", "Email", "Notes"]
  def initialize()
     @system = System.new
  end

  def gather_data(type)
    puts "Please enter the #{type}:"
    gets.chomp
  end

  def contact_menu
    puts "1. ID"
    puts "2. First name"
    puts "3. Last name"
    puts "4. Email"
    puts "5. Notes"
  end

  def add_contact_first
    #is it better for individual or array passing
    first_name = gather_data("first name")
    @system.add_contact(first_name)  #CALL THE INSANCE VAR OF THE NEW db
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
    contact_info = INFO
    info = contact_info.map {|x| gather_data(x)}
    @system.add_contact(info) 
  end

  def edit_contact
    id = gather_data("Contact ID")
    printable = []
    INFO.each_with_index {|x,i| printable << "#{i}. #{x}"}
    info_type = gather_data("number of the attribue you want to change\n#{printable}")
    new_info = gather_data("new value you want for the #{INFO[0]}")
    @system.edit_contact(id, info_type, info_type)
  end

  def show_one_contact
    id = gather_data("Contact ID")
    @system.show_one_contact(ID)
  end

  def show_all
    puts "Display all contacts"
    @system.show_all
  end

  def run
    done = false
    while !done
      main_menu
      print "\n>> " 
      input = gets.chomp.to_i
      if input == 1
        add_contact
      elsif input == 2
        edit_contact
      elsif input ==3
       show_all
     elsif input ==4
       show_one_contact
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

