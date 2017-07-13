module MakeNew
  module InstanceMethods
    def make(array)
      type = array[0].split("_").last
      array.shift

      if type == "alert"
        array.each do |alert|
          new_alert = Alert.new
          new_alert.title = alert.css('a:not(.readmore)').text
          new_alert.summary = alert.css('span').text
          new_alert.readmore = "#{@url.gsub(/\/travel\/notices/, "")}#{alert.css('.readmore').attr('href').text}"
          @notice.add_alert(new_alert)
       end
      elsif type == "warn"
        array.each do |warn|
          new_warn = warn.new
          new_warn.title = warn.css('a:not(.readmore)').text
          new_warn.summary = warn.css('span').text
          new_warn.readmore = "#{@url.gsub(/\/travel\/notices/, "")}#{warn.css('.readmore').attr('href').text}"
          @notice.add_warn(new_warn)
        end

      elsif type == "watch"
        array.each do |watch|
          new_watch = Watch.new
          new_watch.title = watch.css('a:not(.readmore)').text
          new_watch.summary = watch.css('span').text
          new_watch.readmore = "#{@url.gsub(/\/travel\/notices/, "")}#{watch.css('.readmore').attr('href').text}"
          @notice.add_watch(new_watch)
        end
      end
    end
  end
end
