class CreatePartyTemplateElements < ActiveRecord::Migration[6.0]
  def change
    create_table :party_template_elements do |t|
      t.string :name
      t.string :description
      t.integer :priority, default: 0
      t.references :party_template

      t.timestamps
    end
  end
end
