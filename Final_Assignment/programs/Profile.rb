require_relative 'Login'
require_relative 'Validation'
require_relative 'Login'
require 'csv'
class Profile
  include Validation

  def dispOptions
    @user=Login.whoLoggedIn
    puts "********** Profile Page ***********"
    puts "\nWelcome ,"+@user
    puts "1.Transfer\n2.Withdraw\n3.Deposit\n4.View Balance\n5.Logout \nEnter your choice\n"
    option=gets
    return option
  end
  def transfer
    valid=false
    while(valid==false)
      puts "Enter recievers account number\n"
      @rec_acc_no=Integer(gets)
      if Validation.alreadyExists?(@rec_acc_no,'acc_no')==false
        puts "Account does not exist.."
        valid=false
        next
      end
      valid=true
    end
    puts "Enter recievers username\n"
    @rec_username=gets.chomp
    valid=false
    while (valid==false)
      puts "Enter amount\n"
      @amount=Integer(gets)
      if Validation.checkBalance(@user,@amount)==false
        puts "You dont have sufficient balance\n"
        valid=false
        next
      end
      valid=true
    end
    all_records = CSV.read('/home/shivam/Ruby_Assignment-Home/Final_Assignment/DataFiles/Details.csv', )
    for i in (0..all_records.length-1)
      if all_records[i][3]==@rec_username
        rec_details=all_records[i]

        rec_details[5]=rec_details[5].to_i+@amount


      end
      if all_records[i][3]==@user
        sender_details=all_records[i]
       sender_details[5]=sender_details[5].to_i-@amount

      end
      puts "Transaction Successful"

    end


    CSV.open('/home/shivam/Ruby_Assignment-Home/Final_Assignment/DataFiles/Details.csv', 'wb') { |csv|
      #csv << headers
    all_records.each{|row|
      csv << row}}





   # valid=false
    #while(valid==false)
     # puts "Enter your password to send money"
      #password=gets
     # if Validation.checkUserPassword(@user,password)==true


      #end
    #end
  end
  def withdraw(userIndex,transaction)
    valid=false
    while (valid==false)
      puts "Enter amount\n"
      amount=Integer(gets)
      if Validation.checkBalance(@user,amount)==false
        puts "You dont have sufficient balance\n"
        valid=false
        next
      else
        rows_array = CSV.read('/home/shivam/Ruby_Assignment-Home/Final_Assignment/DataFiles/Details.csv')

        desired_indices = [userIndex].sort # these are rows you would like to modify
        rows_array.each_with_index do |row, index|
          if desired_indices.include?(index)

            # modify over here
            if transaction=="Withdraw"
              rows_array[index][5]=rows_array[index][5].to_i-amount
            elsif transaction=="Deposit"
              rows_array[index][5]=rows_array[index][5].to_i+amount
            end


          end
        end

          # now update the file
          #headers=['acc_no','name','username','age','password','balance']
        CSV.open('/home/shivam/Ruby_Assignment-Home/Final_Assignment/DataFiles/Details.csv', 'wb') { |csv|
          #csv << headers
          rows_array.each{|row|
            csv << row}}
      end
      puts "Transaction Successful !!"
      valid=true
    end
  end

  def viewBalance
    all_records = CSV.read('/home/shivam/Ruby_Assignment-Home/Final_Assignment/DataFiles/Details.csv', :headers=>true)
    rec=all_records.select{|record|record['username']==@user}
    puts "Hi, "+@user+" Your balance is "+rec[0][5].to_s
    puts "Input anything to go to previous menu"
    anything=gets
  end
end

#Profile.new.viewBalance