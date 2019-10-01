class AddSlugToCompanyPages < ActiveRecord::Migration[6.0]
  def change
    add_column :company_pages, :slug, :string, index: true
  end
end
