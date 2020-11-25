require_relative 'boot'



require 'rails/all'
class Application < Rails::Application
  config.generators do |g|
    g.test_framework :rspec,
                    model_specs: true,
                    view_specs: false,
                    helper_specs: false,
                    routing_specs: false,
                    controller_specs: false,
                    request_specs: false

end
end

Bundler.require(*Rails.groups)

module TaskMgmt
  class Application < Rails::Application

    config.load_defaults 5.2
    config.time_zone = "Tokyo"
    config.active_record.default_timezone = :local


  end
end
