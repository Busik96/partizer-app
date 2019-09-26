# frozen_string_literal: true

class CreateCompanyFiles < ActiveRecord::Migration[6.0]
  def change
    create_table :company_files do |t|
      t.string :name
      t.references :company

      t.timestamps
    end
  end
end
