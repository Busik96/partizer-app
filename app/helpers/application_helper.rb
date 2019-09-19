# frozen_string_literal: true

module ApplicationHelper
  FLASH_TO_BOOTSTRAP_CLASS = {
    success: 'alert-success',
    error: 'alert-danger',
    alert: 'alert-warning',
    notice: 'alert-info'
  }.freeze.with_indifferent_access

  def bootstrap_class_for_flash(flash_type)
    if FLASH_TO_BOOTSTRAP_CLASS.key?(flash_type)
      FLASH_TO_BOOTSTRAP_CLASS[flash_type]
    else
      flash_type.to_s
    end
  end
end
