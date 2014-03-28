class Contact

  attr_accessor :notes, :name

  def initialize
    @notes = ""
  end

  def to_s
    "Name: #{@name}\nNotes: #{@notes}"
  end
end

bob= Contact.new
bob.notes = "Spoke to bob"