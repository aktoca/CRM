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

  def edit_contact(id, info_type, new_info)
    puts "here is the info: "
    puts id
    puts info_type
    puts new_info
    @contacts.each do |contact|
      if contact.id == id
        if info_type == 0
          contact.first_name = new_info
        elsif info_type == 1
          contact.last_name = new_info
        elsif info_type == 2
          contact.email = new_info
        elsif info_type == 3
          contact.notes = new_info
        end
      puts new_info
      
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

end