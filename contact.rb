require 'csv'
require_relative 'contact_database'
@person = CSV.read('contacts.csv')

#csv_string = CSV.generate do |csv|
#  csv << [a_string]
#  end
class Contact
  attr_accessor :email, :name, :phone

  def initialize(email, name, phone)
    # TODO: assign local variables to instance variables
    @email = email
    @name = name
    @phone = []
    @phone = phone
    @entry_array = [@email, @name, @phone]
    ContactDatabase.save(@entry_array)
  end

  def to_s
    # TODO: return string representation of Contact
    @email.to_s + @name.to_s + @phone.to_s
  end
 
 def save
    array = [self.email, self.name, self.phone]
    ContactDatabase.save(@entry_array)
 end

  ## Class Methods
  #Here is a list of available commands:
    #new  - Create a new contact
    #list - List all contacts
    #show - Show a contact
    #find - Find a contact
  class << self
    def create(email, name, phone)
    #   # TODO: Will initialize a contact as well as add it to the list of contacts  
    end

    def find(term)
      # TODO: Will find and return contacts that contain the term in the first name, last name or email
    end
 
    def all
      # TODO: Return the list of contacts, as is
      CSV.foreach('contacts.csv') { |row| row.inspect}
    end
    
    def show(id)
      # TODO: Show a contact, based on ID
      @data[id]
    end
  end
end



