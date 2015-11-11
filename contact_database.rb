## TODO: Implement CSV reading/writing
require 'csv'

class ContactDatabase
  attr_reader :data

  def initialize
    @data = CSV.read('contacts.csv')
  end

  def self.save(contact)
    CSV.open("contacts.csv", "a") do |csv|
      #csv.write(contact.to_array + '\n')
      # contact.each do|i|s
      csv << contact
    end
  end

  def read
    @data.each {|e| p e}
    #p "#{@person.size} records total"
  end

  def find(id)
    @data[id-1]
  end

  def seek(key)
    p @data.select{|item| item [0].include?(key) || item [1].include?(key) }
  end

  def check_dupe(key)
    @data.each.any?{|item| item[0] == key }  
  end

end
#a = CSV.read('touch_contacts.csv')
#a = ContactDatabase.new
#p a.class
#p a.grep(/Joe/)
#p a.select {|x| x.to_s.include?('Joe')}
