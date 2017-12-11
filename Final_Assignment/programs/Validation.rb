require 'csv'
module Validation
  def self.checkAccNo(acc_no)
    len=Math.log10(acc_no).to_i + 1
    if len!=3
      return false
    elsif Validation.alreadyExists?(acc_no,'acc_no')==true
      return false
    end
  end
  def self.alreadyExists?(acc_no,col_name)
    all_records = CSV.read('/home/shivam/Ruby_Assignment-Home/Final_Assignment/DataFiles/Details.csv', :headers=>true)
     accnos=all_records[col_name]

    for i in (0..accnos.length-1)
      if accnos[i].to_i==acc_no.to_i
        return true
      end
    end
    return false
  end
  def self.checkUsername(acc_no,col_name)
    all_records = CSV.read('/home/shivam/Ruby_Assignment-Home/Final_Assignment/DataFiles/Details.csv', :headers=>true)
    accnos=all_records[col_name]
    for i in (0..accnos.length-1)
      if accnos[i]==acc_no
        return true
      end
    end
    return false
  end

  def self.checkName(name)
    if /^[a-zA-Z]+$/.match(name)==nil
      return false
    end
  end
  def self.checkPassword(password,confirm_password)
    if password!=confirm_password
      return false
    end
  end
  def self.checkBalance(user,amount)
    all_records = CSV.read('/home/shivam/Ruby_Assignment-Home/Final_Assignment/DataFiles/Details.csv', :headers=>true)
    user_record=all_records.select{|record| record["username"]==user}
    if user_record[0][5].to_i <= amount
      return false
    end
      return true
  end
  def self.checkUserPassword(user,password)
    all_records = CSV.read('/home/shivam/Ruby_Assignment-Home/Final_Assignment/DataFiles/Details.csv', :headers=>true)
    user_record=all_records.select{|record| record["password"]==password}

      return true





  end


end
#puts Validation.checkUserPassword("Shom","shom")