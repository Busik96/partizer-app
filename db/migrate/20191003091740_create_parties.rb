class CreateParties < ActiveRecord::Migration[6.0]
  def change
    create_table :parties do |t|
      t.string :name
      t.references :party_template, foreign_key: true
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
