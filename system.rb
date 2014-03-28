class System
  def initialize
    @contacts = []
  end

  def add_contact(input)
    #input given as array INFO
    new_contact = Info.new
    new_contact.first_name = input[0] 
    new_contact.last_name = input[1]
    new_contact.email = input[2]
    new_contact.notes = input[3]

    @contacts << new_contact
  end

  def contact_info_type(info_type)
    if info_type == 1
      id
    elsif info_type ==2
      first_name
    elsif info_type == 3
      last_name
    elsif info_type == 4
      email
    elsif info_type == 5
      notes
    end
  end

  def edit_contact(id, info_type, new_info)
    puts "here is the info: "
    type = contact_info_type(info_type)
    @contacts.each do |contact|
      if contact.type == info_type
        contact.type = new_info
      else
        puts "Unable to find that Contact"
      end
    end
  end

  def show_all
    @contacts.each do |contact|
      puts contact.to_s
    end
  end

  def show_one_contact(info_type)
    @contacts.each do |contact|
      if contact.id == id
        puts contact.to_s
      end
    end
  end

  def contacts_by_attr(info_type)
    @contacts.each do |contact|
      if info_type == 0
       puts contact.first_name
      elsif info_type == 1
        puts contact.last_name
      elsif info_type == 2
        puts contact.email
      elsif info_type == 3
        puts contact.notes
      end
    end
  end

  def delete_contact(id)
    @contacts.delete_if {|c| c.id == id}
    puts "Removed contact with ID #{id}"
  end

end