class CreatePartyGuests < ActiveRecord::Migration[6.0]
  def change
    create_table :party_guests do |t|
      t.string :name
      t.references :party, null: false, foreign_key: true

      t.timestamps
    end
  end
end
