class AddPublishedToPartyTemplates < ActiveRecord::Migration[6.0]
  def change
    add_column :party_templates, :published, :boolean, default: false
  end
end
