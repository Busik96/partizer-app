# frozen_string_literal: true

class UsersController < ProtectedController
  before_action :find_user

  private

  def find_user
    @user = User.find(params[:id]) if params[:id]
  end
end
