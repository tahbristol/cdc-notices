require 'open-uri'
require 'nokogiri'
require 'openssl'
class Scraper




    def get_Page
     html = open("https://wwwnc.cdc.gov/travel/notices", ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE)
     doc = Nokogiri::HTML(html)
    end




end
