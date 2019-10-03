# frozen_string_literal: true

ActiveAdmin.register PartyTemplate do
  permit_params :name, :description, :settings, :published

  index do
    selectable_column
    id_column
    column :name
    column :description
    column :published
    column :parties do |obj|
      obj.parties.count
    end
    actions
  end

  filter :name
  filter :description
  filter :published

  action_item :view_elements, only: %i[show edit] do
    link_to 'Elementy', admin_party_template_party_template_elements_path(resource)
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :description
      f.input :settings, as: :json
      f.input :published, type: :checkbox
    end
    f.actions
  end
end
