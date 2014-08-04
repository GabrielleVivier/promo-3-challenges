require_relative '../views/users_view'

class UsersController

  def initialize
    @view = UsersView.new
  end

  def list
    @view.display_all(User.all)
  end

  def find_user(email)
    User.find_by(email: email)
  end

  def check_user_email_existence(email)
    if find_user(email)
      true
    else
      false
    end
  end

  def create_user
    name = @view.ask_and_get('name')
    email = @view.ask_and_get('email')
    User.create(name: name, email: email)
  end

  def signing_up
    user = create_user
    if user.valid?
      true
    else
      user_errors(user)
    end
  end

  def user_errors(user)
  end

  def save_user(user)
    user.save
  end

  def signing_up_result(result)
    if result
      @view.registration_success
    else

    end
  end

  def signing_in_result(result)
    if result
      @view.identification_success
    else
      @view.identification_failure
    end
  end

  def signing_in
    2.times do
      check = ask_and_check_email
      return check if check
      @view.email_not_found
    end
    ask_and_check_email
  end

  def ask_and_check_email
    email = @view.ask_and_get('email')
    check_user_email_existence(email)
  end

end