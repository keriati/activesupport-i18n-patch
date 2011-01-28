require 'rails/configuration'

module Rails
  class Railtie
    class Configuration

      def after_configuration(&block)
        ActiveSupport.on_load(:after_configuration, :yield => true, &block)
      end

    end
  end
end
