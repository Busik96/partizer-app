# frozen_string_literal: true

module PartyServices
  class SetupTemplate
    def call(party)
      return if party.party_template.blank?

      party.party_template.party_template_elements.each do |template_element|
        party.party_elements.create(party_template_element: template_element)
      end
    end
  end
end
