require_relative "../views/sessions_view"

class SessionsController
  def initialize(employee_repo)
    @sessions_view = SessionsView.new
    @employee_repo = employee_repo
  end
  def sign_in
    username = @sessions_view.ask_for(:username)
    password = @sessions_view.ask_for(:password)
    employee = @employee_repo.find_by_username(username)
    if employee && employee.password == password
      @sessions_view.logged_in
      return employee
    else
      @sessions_view.wrong_credentials
      sign_in
    end
  end
end