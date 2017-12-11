require 'csv'
class Login
  attr_accessor :user
 def dispLoginPage
   puts "******** LogIn ********"
   puts "Enter username"
   @username=gets.chomp
   puts "Enter password"
   @password=gets.chomp
   puts "Type 'Login' to proceed..\n"
   msg=gets.chomp
   return msg
 end
  def checkLogin
    all_records = CSV.read('/home/shivam/Ruby_Assignment-Home/Final_Assignment/DataFiles/Details.csv', :headers=>true)
    for i in (0..all_records.length-1)
      if all_records['username'][i]==@username && all_records['password'][i]==@password
        @@user=@username
        @userIndex=i+1
        return true
      end
    end
    return false
  end
  def getUserIndex
    return @userIndex
  end
  def self.whoLoggedIn
    return @@user
  end
end