options = Selenium::WebDriver::Chrome::Options.new
options.add_argument("headless") if ENV["CI"]

Capybara.register_driver(:chrome) do |app|
  Capybara::Selenium::Driver.new(
    app,
    browser: :chrome,
    options: options
  )
end

Capybara.configure do |config|
  config.default_driver = :chrome
  config.javascript_driver = :chrome
  config.default_max_wait_time = 10
end
