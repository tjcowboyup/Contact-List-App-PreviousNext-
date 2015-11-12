require_relative 'contact'
require 'csv'
person = CSV.read('contacts.csv')

@counter = 0
#a_string="John,45\n Marie,20"

#CSV.foreach('touch_contacts.csv') do |row|
#  row.inspect
#  @counter += 1
#end

#a_string = "\*\"
#CSV.parse(a_string) { |row| puts row.inspect } 
#p @counter

def command

   # p "Enter 'help' for options menu"
    @response = ARGV[0]
    if ARGV[0] == "help"
      puts "new  - Create a new contact"
      puts "list - List all contacts"
      puts "show - Show a contact"
      puts "find - Find a contact"
    else
      p "Nothing entered"
      nil
    end
    
    case ARGV[0]
    when "new"
      p "Enter email: "
      @email = STDIN.gets.chomp
      @answer = ContactDatabase.new
      if @answer.check_dupe(@email)
        p "Duplicate email in database"
      else
        p "Enter name: "
        @name = STDIN.gets.chomp
        
        p "Entering phone number(s)? [Y/N]"
        @ans = STDIN.gets.chomp
        if @ans == 'Y'
          p "Enter phone numbe type and number: [N to quit entering]"
          @phone = STDIN.gets.chomp.split(' ')
          Contact.new(@email, @name, @phone)
          p @phone[@phone.size]
          while @phone[@phone.size-1][0] != 'N'
            p "Enter phone numbe type and number: "
            @phone << STDIN.gets.chomp.split(' ')
          end
          @phone.pop if @phone[@phone.size-1][0] == 'N'
        else
          Contact.new(@email, @name, nil)
        end

        p "#{@email}, #{@name}, #{@phone} is added to contacts database"
      end
    when "list"
      @answer = ContactDatabase.new
      @answer.read
    when "show"
      
      # "Enter id number: "
      @id = ARGV[1].to_i
      @answer=ContactDatabase.new
      p @answer.find(@id)
    when "find"
      # "Enter search term:"
      @term = ARGV[1].to_s
      @answer = ContactDatabase.new
      @answer.seek(@term)
    end   

  end

command

