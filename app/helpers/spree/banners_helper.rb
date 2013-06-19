module Spree
  module BannersHelper

    def insert_banner(id, options = {})
      # max items show for list
      options[:max] ||= 1
      # category items show
      options[:category] ||= "home"
      # class items show
      options[:class] ||= "banner"
      id = id
      banners = Spree::Banner.enable(options[:category]).limit(options[:max])
      if !banners.blank?
        banners = banners.sort_by { |ban| ban.position }

        banner = content_tag :div, :id => id, :class => options[:class] do
          banners.each do |banner|
            concat(link_to(image_tag(banner.attachment.url(options[:category])), (banner.url.blank? ? "javascript: void(0)" : banner.url)))
          end
        end
        script = javascript_tag do
          raw("
            $(function(){
              $('##{id}').slidesjs({
                width: #{banners.first.attachment_width},
                height: #{banners.first.attachment_height},
                navigation: {
                  active: false
                },
                play: {
                  active: false,
                  interval: 8000,
                  auto: true,
                  pauseOnHover: false
                }
              });
            });")
        end

        banner + script
      end
    end

  end
end
