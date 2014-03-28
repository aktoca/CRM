class Info
  @@id_counter = 1000

  attr_accessor :first_name, :last_name, :email, :notes, :id

  def initialize
    @id = Info.get_id
  end

  def to_s
    puts "ID: #{@id}\nName: #{@first_name} #{@last_name}\nEmail: #{email}\nNotes: #{@notes}"
  end

  def self.get_id
    @@id_counter += 1
    @@id_counter
  end

end