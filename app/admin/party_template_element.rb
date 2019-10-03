# frozen_string_literal: true

ActiveAdmin.register PartyTemplateElement do
  belongs_to :party_template
  permit_params :name, :description, :priority, category_ids: []

  filter :name
  filter :description

  form do |f|
    f.inputs do
      f.input :name
      f.input :description
      f.input :category_ids, multiselect: true, as: :tags, collection: Category.all
      f.input :priority, as: :select, collection: (0..10).to_a
    end
    f.actions
  end
end
