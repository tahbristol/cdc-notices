require 'open-uri'
require 'nokogiri'
require 'openssl'
require_relative 'readmore.rb'
class Scraper

  attr_accessor :url

  def initialize(url)
    @url = url
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

         puts array_alert[0]

          alert_hash[:title] = array_alert[0].css('a:not(.readmore)').text
          alert_hash[:summary] = array_alert[0].css('span').text
          alert_hash[:readmore] = array_alert[0].css('a').attr('href').text
          puts "TITLE #{alert_hash[:title]}"
          puts "SUMMARY #{alert_hash[:summary]}"
          puts "READMORE #{alert_hash[:readmore]}"





    end


end
