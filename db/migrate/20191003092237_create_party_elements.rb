class CreatePartyElements < ActiveRecord::Migration[6.0]
  def change
    create_table :party_elements do |t|
      t.references :party, null: false, foreign_key: true
      t.references :company, foreign_key: true
      t.references :party_template_element, foreign_key: true
      t.string :status
      t.float :amount
      t.string :notes

      t.timestamps
    end
  end
end
