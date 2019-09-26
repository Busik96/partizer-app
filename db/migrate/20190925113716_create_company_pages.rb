# frozen_string_literal: true

class CreateCompanyPages < ActiveRecord::Migration[6.0]
  def change
    create_table :company_pages do |t|
      t.string :title
      t.string :menu_title
      t.boolean :published, default: false
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
