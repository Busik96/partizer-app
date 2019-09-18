# frozen_string_literal: true

ActiveAdmin.register User do
  permit_params :first_name, :last_name, :phone_number, :email,
                :password, :password_confirmation

  index do
    selectable_column
    id_column
    column :first_name
    column :last_name
    column :phone_number
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :first_name
  filter :last_name
  filter :phone_number
  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :first_name
      f.input :last_name
      f.input :phone_number
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
end
