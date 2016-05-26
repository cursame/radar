RSpec.configure do |config|
  config.after :all do
    FileUtils.rm_rf(Dir["#{Rails.root}/spec/support/uploads"])
  end
end
