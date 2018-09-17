require 'i18n_extract'
require 'rails'

module I18nExtract
  class Railtie < Rails::Railtie
    railtie_name :i18n_extract

    rake_tasks do
      path = File.expand_path(__dir__)
      Dir.glob("#{path}/tasks/**/*.rake").each { |f| load f }
    end
  end
end
