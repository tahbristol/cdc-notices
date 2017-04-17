require 'open-uri'
require 'nokogiri'
require 'openssl'
require_relative 'notice_description.rb'
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
        main_content = self.get_page.css('#contentArea')
        intro_title = main_content.css('h2').first.text
      #  puts intro_title
        notice_legend = main_content.css('.ntl').text
      #  puts notice_legend

        alert_title = main_content.css('.list-block a:not(.readmore)')
        alert_description = main_content.css('.summary')
        readmore = main_content.css('.list-block a:not(.readmore)')
        alert_readmore = []
        readmore.each {|des| alert_readmore << "https://wwwnc.cdc.gov#{des.attr('href')}"}
        readmore_page = []
          alert_readmore.each do |page|
            page = ReadMore.new
            page.content = "This is content for #{page}"
            readmore_page << page
           end
           readmore_page.each do |content|
             puts content.content
           end
        #puts readmore_page.css('#contentArea').text




    end


end
