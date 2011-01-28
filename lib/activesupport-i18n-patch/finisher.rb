module Rails
  class Application
    module Finisher

      initializer :before_finisher_hook do
        ActiveSupport.run_load_hooks(:after_configuration, self)
      end

    end
  end
end
