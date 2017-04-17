require 'open-uri'
require 'nokogiri'
require 'openssl'
class Scraper




    def get_Page
     html = open("https://wwwnc.cdc.gov/travel/notices", ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE)
     doc = Nokogiri::HTML(html)
    end

    def set_attributes
        main_content = self.get_Page.css('#contentArea')
        intro_title = main_content.css('h2').first.text
      #  puts intro_title
        notice_legend = main_content.css('.ntl').text
      #  puts notice_legend

        alert_title = main_content.css('.list-block a:not(.readmore)')
        alert_description = main_content.css('.summary')
        readmore = main_content.css('.list-block a:not(.readmore)')
        alert_readmore = []
        readmore.each {|des| alert_readmore << "https://wwwnc.cdc.gov#{des.attr('href')}"}

        


    end


end
