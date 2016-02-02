# The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
I18n.default_locale = :es
I18n.load_path += Dir[Rails.root.join('config', 'locales','**','*.{rb,yml}')]
I18n.available_locales = [:es, :en, :devise]
