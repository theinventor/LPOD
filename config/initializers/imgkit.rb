# config/initializers/imgkit.rb
IMGKit.configure do |config|
  config.wkhtmltoimage = '/usr/local/bin/wkhtmltoimage'
  config.default_options = {
    :quality => 100,
    :width => 1024
  }
  config.default_format = :png
end