class CreatePartyTemplateElementCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :party_template_element_categories do |t|
      t.references :category, null: false, index: false
      t.references :party_template_element, null: false, index: false

      t.timestamps
    end

    add_index :party_template_element_categories, :category_id, name: 'pte_category_id'
    add_index :party_template_element_categories, :party_template_element_id, name: 'pte_party_template_element_id'
    add_foreign_key :party_template_element_categories, :categories, name: 'pk_pte_category'
    add_foreign_key :party_template_element_categories, :party_template_elements, name: 'pk_pte_ele'
  end
end
