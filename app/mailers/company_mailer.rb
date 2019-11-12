# frozen_string_literal: true

class CompanyMailer < ApplicationMailer
  def company_added_to_party
    @company = params[:company]
    @user = @company.user

    mail to: @user.email, subject: 'Twoja firma została właśnie dodana do imprezy!'
  end
end
