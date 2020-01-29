class SessionsView
  def ask_for(something)
    puts "#{something}?"
    return gets.chomp
  end

  def logged_in
    puts "You've signed in!"
  end

  def wrong_credentials
    puts "Wrong username or password, try again!"
  end
end