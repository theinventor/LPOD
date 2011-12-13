# config/initializers/imgkit.rb
IMGKit.configure do |config|
  config.wkhtmltoimage = Rails.root.join('bin', 'wkhtmltoimage-amd64').to_s if ENV['RACK_ENV'] == 'production'
  config.wkhtmltoimage = '/usr/local/bin/wkhtmltoimage' if ENV['RACK_ENV'] == 'development' 
  config.default_options = {
    :quality => 100,
    :width => 1024
  }
  config.default_format = :png
end   