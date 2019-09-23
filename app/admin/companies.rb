# frozen_string_literal: true

ActiveAdmin.register Company do
  permit_params :name, :nip, :short_description

  index do
    selectable_column
    id_column
    column :name
    column :nip
    column :short_description
    actions
  end

  filter :name
  filter :nip
  filter :short_description

  form do |f|
    f.inputs do
      f.input :name
      f.input :nip
      f.input :short_description
    end
    f.actions
  end
end
