require 'open-uri'
require 'nokogiri'
require 'openssl'

require_relative 'notice.rb'
require_relative 'alert.rb'
class Scraper

  attr_accessor :url

  def initialize(url)
    @url = url
    @notice = Notice.new

  end

    def get_page
     html = open(@url, ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE)
     doc = Nokogiri::HTML(html)

    end

    def set_attributes
      array_alert = []
        main_content = self.get_page.css('#contentArea')
        list_blocks = main_content.css('.list_block')
        notice_hash = {:alert => main_content.css('#alert'), :watch => main_content.css('#watch'), :warning => main_content.css('#warning')}

        alerts = notice_hash[:alert].collect {|alert| alert.css('li')}
        watches = notice_hash[:watch].collect {|watch| watch.css('li')}
        warnings = notice_hash[:warning].collect {|warning| warning.css('li')}

        alert_hash = {:title =>"",:summary => "", :readmore => ""}
          alerts[0].each do |sl|
            array_alert << sl
          end

             




           array_alert.each do |alert|
                new_alert = Alert.new


           new_alert.title = alert.css('a:not(.readmore)').text
           new_alert.summary = alert.css('span').text
           new_alert.readmore = "#{@url.gsub(/\/travel\/notices/, "")}#{alert.css('a').attr('href').text}"

           @notice.add_alert(new_alert)
          end
             @notice



    end







end
