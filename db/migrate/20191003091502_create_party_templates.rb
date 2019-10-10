class CreatePartyTemplates < ActiveRecord::Migration[6.0]
  def change
    create_table :party_templates do |t|
      t.string :name
      t.string :description
      t.jsonb :settings

      t.timestamps
    end
  end
end
