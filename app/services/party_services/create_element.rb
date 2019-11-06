# frozen_string_literal: true

module PartyServices
  class CreateElement
    def call(party, company_id)
      element = party.party_elements.create!(company_id: company_id)
      send_notification(company_id) if element.persisted?
      element
    end

    private

    def send_notification(company_id)
      company = Company.find(company_id)
      return unless company.notify_on_pt_added?

      CompanyMailer.with(company: company).company_added_to_party.deliver_later
    end
  end
end
