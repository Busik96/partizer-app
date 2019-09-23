# frozen_string_literal: true

class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :address1
      t.string :address2
      t.string :city
      t.string :zipcode
      t.string :phone_number
      t.float :latitude
      t.float :longitude
      t.references :addressable, polymorphic: true

      t.timestamps
    end
  end
end
