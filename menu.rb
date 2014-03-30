require './system'
require './info'

class Menu
  INFO = ["ID", "First Name", "Last Name", "Email", "Notes"]
  
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
    INFO.each_with_index {|x, i| puts "#{i+1}. #{x}"}
  end

  def get_field
    puts "--------Customer Attributes------"
    field_menu
    gather_data("number of the attribute")
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
    puts "Add a Contact"
    contact_info = INFO[1..4]
    info = contact_info.map {|x| gather_data(x)}
    @system.add_contact(info) 
    puts "\e[H\e[2J"
    puts "\n*** Contact Added\n"
  end

  def modify_contact    
    puts "--------\nModify a Contact\n------"
    info_type = get_field.to_s
    who = gather_data("contact you want to change (by attribute)")
    puts "Current Contact Information:"
    @system.display_partipular_contacts(info_type,who) 
    new_info = gather_data("new value you want for the attribute")
    @system.modify_contact(info_type, new_info,who) 
    confirm? ? (puts "Contact Updated") : (puts "Edit canceled")

  end

  def display_all_contacts
    puts "----------\nAll contacts\n----------"
    @system.display_all_contacts
  end

  def display_partipular_contacts
    puts "Display One Contact"
    info_type = get_field
    who = gather_data("contact you want to display")
    puts
    @system.display_partipular_contacts(info_type, who)
  end

  def display_info_by_attribute
    info_type = get_field
    puts
    puts "======\nContacts by #{INFO[info_type.to_i - 1]}\n======="
    @system.display_info_by_attribute(info_type)
  end

  def delete_contact
    info_type = get_field
    who = gather_data("contact you want to remove")
    puts "This is the contact you are deleting:" 
    @system.display_partipular_contacts(info_type,who)
    confirm? ? (puts "Contact Deleted") : (puts "Delete canceled")
    @system.delete_contact(info_type,who)
    puts "\e[H\e[2J"
  end

  def run
    done = false
    while !done
      main_menu
      print "\n>> " 
      input = gets.chomp.downcase
      if input == '1' || input == 'add'
        add_contact
      elsif input == '2' || input == 'modify'
        modify_contact
      elsif input == '3' || input == 'display all'
         display_all_contacts
      elsif input == '4' || input == 'display contact'
         display_partipular_contacts
      elsif input == '5' || input == 'display attribute'
         display_info_by_attribute
      elsif input == '6' || input == 'delete'
         delete_contact      
      elsif input == '7' || input == 'exit'
        done = true
      end
    end
  end

end

menu = Menu.new
menu.run
