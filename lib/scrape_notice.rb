require 'open-uri'
require 'nokogiri'
require 'openssl'

require_relative 'notice.rb'
require_relative 'alert.rb'

require_relative 'watch.rb'
require_relative 'warn.rb'
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
     array_watch = []
     array_warn = []
       main_content = self.get_page.css('#contentArea')

       notice_hash = {:alert => main_content.css('#alert'), :watch => main_content.css('#watch'), :warn => main_content.css('#warn')}

       alerts = notice_hash[:alert].collect {|alert| alert.css('li')}

       if alerts[0] != nil
         alerts[0].each do |alert|
           array_alert << alert
         end
       end


       watches = notice_hash[:watch].collect {|watch| watch.css('li')}
       if watches[0] != nil
         watches[0].each do |watch|
           array_watch << watch
         end
       end

       warns = notice_hash[:warn].collect {|warn| warn.css('li')}
       if warns[0] != nil
         warns[0].each do |warn|
           array_warn << warn
         end
       end

          array_alert.each do |alert|
               new_alert = Alert.new
          new_alert.title = alert.css('a:not(.readmore)').text
          new_alert.summary = alert.css('span').text
          new_alert.readmore = "#{@url.gsub(/\/travel\/notices/, "")}#{alert.css('a').attr('href').text}"

          @notice.add_alert(new_alert)
         end

         array_watch.each do |watch|
           new_watch = Watch.new
           new_watch.title = watch.css('a:not(.readmore)').text
           new_watch.summary = watch.css('span').text
           new_watch.readmore = "#{@url.gsub(/\/travel\/notices/, "")}#{watch.css('a').attr('href').text}"
           @notice.add_watch(new_watch)
         end

         array_warn.each do |warn|
           new_warn = warn.new
           new_warn.title = warn.css('a:not(.readmore)').text
           new_warn.summary = warn.css('span').text
           new_warn.readmore = "#{@url.gsub(/\/travel\/notices/, "")}#{warn.css('a').attr('href').text}"
           @notice.add_warn(new_warn)
         end

           @notice



   end





end
