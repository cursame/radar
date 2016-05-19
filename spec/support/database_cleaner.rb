DatabaseCleaner.strategy = :truncation

RSpec.configure do |config|
  config.use_transactional_fixtures = false

  config.before :each do
    DatabaseCleaner.start
  end

  config.before :each, js: true do
    load "#{Rails.root}/db/seeds.rb"
  end

  config.after :each do
    DatabaseCleaner.clean
  end
end
