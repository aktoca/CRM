class System
  def initialize
    @contacts = []
  end

  def add_contact(input)
    new_contact = Info.new
    new_contact.firstname = input
    puts "I'm here with #{input}"
  end
end