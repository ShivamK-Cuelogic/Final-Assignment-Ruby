
require_relative 'WelcomePage'
require_relative 'Login'
require_relative 'Profile'
require_relative 'Registration'
welcomePageObj=WelcomePage.new
ch=welcomePageObj.dispWelcomePage
while ch!=3
  if ch==2
      registrationObj=Registration.new
      if registrationObj.getData==true
        registrationObj.writeIntoFile
        ch=welcomePageObj.dispWelcomePage
        next
      end
  elsif ch==1
    loginObj=Login.new
    if loginObj.dispLoginPage=="Login"
      if loginObj.checkLogin==true
        profileobj=Profile.new
            userIndex=loginObj.getUserIndex
          choice=profileobj.dispOptions.to_i
          while(choice!=5)
            if choice==1
              profileobj.transfer
              choice=profileobj.dispOptions.to_i
              next
            elsif choice==2
              profileobj.withdraw(userIndex,"Withdraw")
              choice=profileobj.dispOptions.to_i
              next
            elsif choice==3
              profileobj.withdraw(userIndex,"Deposit")
              choice=profileobj.dispOptions.to_i
              next
            elsif choice==4
              profileobj.viewBalance()
              choice=profileobj.dispOptions.to_i
              next
            end
          end

      else
        puts "Incorrect username or password"
      end
    else
      ch=welcomePageObj.dispWelcomePage
      next
    end
  end
end

