class AddUserIdToParties < ActiveRecord::Migration[6.0]
  def change
    add_column :parties, :user_id, :bigint
  end
end
