# frozen_string_literal: true

class ProtectedController < ApplicationController
  include Pundit

  before_action :authenticate_user!
end
