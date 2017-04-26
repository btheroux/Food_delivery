require_relative '../views/view'
require_relative '../models/employee'


class SessionsController
  def initialize(employee_repository)
    @employees = employee_repository
    @view = View.new
    @user = nil
  end

  def sign_in
    until @user && user_password == @user.password
      user_username = @view.ask_for_username
      user_password = @view.ask_for_password
      @user = @employees.find_by_username(user_username)
      if @user && user_password == @user.password
        puts "welcome #{@user.username}"
        return @user
      elsif @user
        puts "wrong password try again"
        @user = nil
      else
        puts "wrong try again"
        @user = nil
      end
    end
  end

  def sign_out
    return @user = nil
  end

end
