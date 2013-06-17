Spree::AppConfiguration.class_eval do
  # Preferences related to banner settings
  preference :banner_default_url, :string, :default => '/spree/banners/:id/:style/:basename.:extension'
  preference :banner_path, :string, :default => '/banners/:id/:style/:basename.:extension'
  preference :banner_url, :string, :default => '/spree/banners/:id/:style/:basename.:extension'
  preference :banner_styles, :string, :default => "{\"frontpage\":\"941x351#\",\"small\":\"120x120#\"}"
  preference :banner_default_style, :string, :default => 'frontpage'
end