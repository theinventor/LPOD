# config/initializers/imgkit.rb
IMGKit.configure do |config| 
  if ENV['RACK_ENV'] == 'production'
    config.wkhtmltoimage = Rails.root.join('lib', 'wkhtmltoimage-amd64').to_s
  else
    config.wkhtmltoimage = '/usr/local/bin/wkhtmltoimage'
  end
   
  config.default_options = {
    :quality => 100,
    :width => 1024
  }
  config.default_format = :png
end   