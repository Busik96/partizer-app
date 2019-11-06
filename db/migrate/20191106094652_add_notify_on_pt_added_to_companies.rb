class AddNotifyOnPtAddedToCompanies < ActiveRecord::Migration[6.0]
  def change
    add_column :companies, :notify_on_pt_added, :boolean, default: false
  end
end
