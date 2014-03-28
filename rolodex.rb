class Rolodex
  def initialize
    @contacts = []
  end


  def create_contact(name)
     contact = Contact.new
     contact.name = name
     @contacts << contact
  end

  def show_contacts
    @contacts.each do |contact|
      #if you putt the following you steal the $ from another class
      #you need to ask for it 
      #puts name
      #puts notes
      puts contact
    end
  end

  def remove_contoct(id)
    #result = nil
    # @contacts.each do |contact| #look through all of our contacts
    #   if contact.id == id
    #     result = contact
    #   end
    # end
    #contacts.delete(result) if result != nil
    #^---same as below
    #
    # result = contaccts.detect do |contact|
    #   contact.id == id
    # end
    # @contacts.delete(result) if result != nil
    #^----same as below
    @contacts.delete_if {|c| c.id == id}
  end

  def edit_contact(id, new_name)
    @contacts.each do |contact|
      if contact.id == id
        contact.name = new_name
      end
    end
  end



end