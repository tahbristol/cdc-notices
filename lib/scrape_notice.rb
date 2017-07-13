require 'open-uri'
require 'nokogiri'
require 'openssl'
require 'pry'
require_relative 'notice.rb'
require_relative 'alert.rb'
require_relative 'watch.rb'
require_relative 'warn.rb'
require_relative 'concerns/make_new'
class Scraper
  include MakeNew::InstanceMethods
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
     array_alert = ["array_alert"]
     array_watch = ["array_watch"]
     array_warn = ["array_warn"]

     main_content = self.get_page.css('#contentArea')
     notice_hash = {:alert => main_content.css('#alert'), :watch => main_content.css('#watch'), :warn => main_content.css('#warn')}
     alerts = notice_hash[:alert].collect {|alert| alert.css('li')}
     watches = notice_hash[:watch].collect {|watch| watch.css('li')}
     warns = notice_hash[:warn].collect {|warn| warn.css('li')}
       if alerts[0] != nil
         alerts[0].each do |alert|
           array_alert << alert
         end
       end

       if watches[0] != nil
         watches[0].each do |watch|
           array_watch << watch
         end
       end

       if warns[0] != nil
         warns[0].each do |warn|
           array_warn << warn
         end
       end

    make(array_alert)
    make(array_warn)
    make(array_watch)

    @notice
    end

end
