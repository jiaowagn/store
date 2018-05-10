module FlashesHelper
  FLASH_CLASSES = {notice: "success", alert: "danger", warning: "warning"}.freeze

  def flash_class(key)
    FLASH_CLASSES.fetch key.to_sym, key
  end

  def user_facing_flashes
    flash.to_hash.slice "notice", "alert", "warning"
  end
end
