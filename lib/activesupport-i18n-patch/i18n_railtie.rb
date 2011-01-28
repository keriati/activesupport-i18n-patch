require "active_support"
require "rails"
require "active_support/file_update_checker"
require "active_support/core_ext/array/wrap"

module I18n
  class Railtie < Rails::Railtie
    # Set the i18n configuration before any eager loading
    # to ensure the I18n.load_path is inited before any
    # classes/models are loaded
    config.before_eager_load do |app|
      fallbacks = app.config.i18n.delete(:fallbacks)

      app.config.i18n.each do |setting, value|
        case setting
        when :railties_load_path
          app.config.i18n.load_path.unshift(*value)
        when :load_path
          I18n.load_path += value
        else
          I18n.send("#{setting}=", value)
        end
      end

      init_fallbacks(fallbacks) if fallbacks && validate_fallbacks(fallbacks)

      reloader.paths.concat I18n.load_path
      reloader.execute_if_updated
    end

  end
end
