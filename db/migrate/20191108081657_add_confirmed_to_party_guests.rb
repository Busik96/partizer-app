class AddConfirmedToPartyGuests < ActiveRecord::Migration[6.0]
  def change
    add_column :party_guests, :confirmed, :boolean, default: false
  end
end
