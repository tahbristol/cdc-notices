require_relative 'scrape_notice.rb'
class Notice

  attr_accessor :notice_date

  def initialize
    @notices = []
    @alert_notices = []
    @warning_notices = []
    @watch_notices = []
  end

  def display_notices
    self.notices.each.with_index(1) do |notice,i|
      puts "**************************"
      puts  "#{i}. #{notice.title}"
      puts notice.summary
      puts notice.readmore
    end
  end
   def display_alerts
      self.alert_notices.each.with_index(1) do |notice,i|
        puts "**************************"
        puts  "#{i}. #{notice.title}"
        puts notice.summary
        puts notice.readmore
      end

end

  def notices
    @notices
  end

 def alerts
   @alert_notices
 end

 def warnings
   @warning_notices
 end

 def watches
   @watch_notices
 end


  def add_alert(alert)
    @notices << alert
    @alert_notices << alert
  end

  def add_watch(watch)
    @notices << watch
    @watch_notices << watch
  end

  def add_warning(warning)
    @notices << warning
    @warning_notices << warning
  end



end
