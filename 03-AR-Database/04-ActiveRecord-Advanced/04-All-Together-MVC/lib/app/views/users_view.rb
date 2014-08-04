class UsersView

  def display_all(all_users)
    all_users.each do |user|
      puts "#{user.id} - #{user.name}, #{user.email}"
    end
  end

  def ask_and_get(output)
    puts "What's is your #{output}?"
    return gets.chomp
  end

  def email_not_found
    puts "Your email was not found! Try again"
  end

  def identification_failure
    puts "Sorry - Your identification failed"
  end

  def identification_success
    puts "You have signed in!"
  end

  def registration_success
    puts "You have sucessfully registered!"
  end

end