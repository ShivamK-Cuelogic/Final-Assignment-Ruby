class WelcomePage
  def dispWelcomePage()
    puts "\n****Welcome to Banking Application*****"
    puts "1.Login \n2.Register \n3.Exit \nEnter your choice\n"
    choice=Integer(gets)
    return choice
  end
end
