# Jekyll plugin to load environment variables into site config
# This allows us to use environment variables in templates while keeping defaults in _config.yml

Jekyll::Hooks.register :site, :after_init do |site|
  # Override reCAPTCHA site key with environment variable if present
  if ENV['RECAPTCHA_SITE_KEY']
    site.config['recaptcha'] ||= {}
    site.config['recaptcha']['site_key'] = ENV['RECAPTCHA_SITE_KEY']
  end
  
  # You can add other environment variables here as needed
  # Example:
  # if ENV['CUSTOM_API_KEY']
  #   site.config['api'] ||= {}
  #   site.config['api']['key'] = ENV['CUSTOM_API_KEY']
  # end
end
