class Info
  @@id_counter = 1000

  attr_accessor :first_name, :last_name, :email, :notes, :id

  def initialize(contact_info)

    @id = Info.get_id
    @first_name = contact_info[0]
    @last_name = contact_info[1]
    @email = contact_info[2]
    @notes = contact_info[3]
  end

  def to_s
    puts "ID: #{@id}\nName: #{@first_name} #{@last_name}\nEmail: #{email}\nNotes: #{@notes}"
  end

  def self.get_id
    @@id_counter += 1
    @@id_counter
  end

end