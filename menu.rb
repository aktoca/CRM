require './system'
require './info'

class Menu
  INFO = ["First Name", "Last Name", "Email", "Notes"]
  def initialize()
     @system = System.new
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

  def field_menu
    puts "1. ID"
    puts "2. First name"
    puts "3. Last name"
    puts "4. Email"
    puts "5. Notes"
  end

  def get_field
    puts "Customer Attribute Fields:"
    puts field_menu.to_s
    gather_data("number of the attribute").to_i
  end

  def gather_data(type)
    puts "Please enter the #{type}:"
    gets.chomp
  end

  def confirm?
    puts "Are you sure you want to continue? (y/n)"
    prompt = gets.chomp
    prompt == 'y'
  end

  def add_contact
    contact_info = INFO
    info = contact_info.map {|x| gather_data(x)}
    @system.add_contact(info) 
  end

  def edit_contact
    info_type = get_field
    puts "Current Contact Information"
    new_info = gather_data("new value you want")
    @system.edit_contact(info_type, new_info)
  end

  def show_all
    puts "Display all contacts"
    @system.show_all
  end

  def show_one_contact
    puts "Display One Contact"
    info_type = get_field
    @system.show_one_contact(info_type)
  end

  def contacts_by_attr
    puts 
    info_type =  get_field
    puts "You are viewing contacts by #{INFO[info_type]}"
    @system.contacts_by_attr(info_type)
  end

  def delete_contact
    info_type = get_field
    puts "This is the contact you are deleting:" 
    @system.show_one_contact(info_type)
    @system.delete_contact(id)
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
       elsif input == 5
         contacts_by_attr
       elsif input == 6
         delete_contact     
       elsif input == 7
        done = true
      end
    end
  end

end

menu = Menu.new
menu.run
