# frozen_string_literal: true

class CreateCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :nip
      t.text :short_description
      t.references :user
      t.timestamps
    end
  end
end
