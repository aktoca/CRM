class System
  def initialize
    @contacts = []
  end

  def add_contact(input)
    #input given as array 
    new_contact = Info.new
    new_contact.first_name = input[0] 
    new_contact.last_name = input[1]
    new_contact.email = input[2]
    new_contact.notes = input[3]
    @contacts << new_contact
  end

  def modify_contact(info_type, new_info, who)
    @contacts.each do |contact|
      if info_type == '1'
        contact.id = new_info if who.to_i == contact.id
      elsif info_type == '2'
        contact.first_name = new_info if who == contact.first_name
      elsif info_type == '3'
        contact.last_name = new_info if who == contact.last_name
      elsif info_type == '4'
        contact.email = new_info if who == contact.email
      elsif info_type == '5'
        contact.notes = new_info if who == contact.notes
      else
          puts "Unable to find Contact"
      end
    end
  end

  def display_all_contacts
    @contacts.each do |contact|
      puts contact.to_s
    end
  end

  def display_partipular_contacts(info_type, who)
    @contacts.each do |contact|
      if info_type == '1'
          puts contact.to_s if contact.id == who.to_i
      elsif info_type == '2'
          puts contact.to_s if contact.first_name == who
      elsif info_type == '3'
          puts contact.to_s if contact.last_name == who
      elsif info_type == '4'
          puts contact.to_s if contact.email == who
      elsif info_type == '5'
          puts contact.to_s if contact.notes == who
      else
        puts "Unable to find Contact"
      end
    end
  end

  def display_info_by_attribute(info_type)
    @contacts.each do |contact| 
      if info_type == '1'
         puts contact.id
      elsif info_type == '2'
         puts contact.first_name
      elsif info_type == '3'
        puts contact.last_name
      elsif info_type == '4'
        puts contact.email
      elsif info_type == '5'
        puts contact.notes
      else
        puts "Unable to find Contact"
      end
    end
  end

  def delete_contact(info_type, who)
    if info_type == '1'
      @contacts.delete_if {|c| c.id == who.to_i}
    elsif info_type == '2'
      @contacts.delete_if {|c| c.first_name == who}
    elsif info_type == '3'          
      @contacts.delete_if {|c| c.last_name == who}
    elsif info_type == '4'      
      @contacts.delete_if {|c| c.email == who}
    elsif info_type == '5'
      @contacts.delete_if {|c| c.notes == who}
    else
      puts "Unable to find Contact"
    end
  end
end