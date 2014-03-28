class System
  def initialize
    @contacts = []
  end

  def add_contact(input)
    new_contact = Info.new
    new_contact.first_name = input[0] 
    new_contact.last_name = input[1]
    new_contact.email = input[2]
    new_contact.notes = input[3]

    @contacts << new_contact
  end

  def show_all
    @contacts.each do |contact|
      puts contact.to_s
    end
  end


end