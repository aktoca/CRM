class Rolodex
  def initialize
    @contactss = []
  end


  def create_contact(name)
     contact = Contact.new
     contact.name = name
     @contacts << contact
  end

  def show_contacts
    @concats.each do |contact|
      #if you putt the following you steal the $ from another class
      #you need to ask for it 
      #puts name
      #puts notes
      puts contacts
    end
  end
end