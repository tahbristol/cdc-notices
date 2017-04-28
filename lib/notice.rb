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
    if self.notices.empty?
      puts "There are no current notices."
    else
      self.notices.each.with_index(1) do |notice,i|
        puts "**************************"
        puts  "#{i}. #{notice.title}"
        puts notice.summary
        puts notice.readmore
      end
    end
#
#puts @alert_notices.size
#puts @notices.size
#puts @warning_notices.size
#puts @watch_notices.size
  end

   def display_alerts
      self.alerts.each.with_index(1) do |notice,i|
        puts "**************************"
        puts  "#{i}. #{notice.title}"
        puts notice.summary
        puts notice.readmore

      end

end

def display_warnings
  if self.warnings.empty?
    puts "There are no current warnings."
  else
   self.warnings.each.with_index(1) do |notice,i|
     puts "**************************"
     puts  "#{i}. #{notice.title}"
     puts notice.summary
     puts notice.readmore

   end
 end

end

def display_watches
  if self.watches.empty?
    puts "There are no current watches."
  else
   self.warnings.each.with_index(1) do |notice,i|
     puts "**************************"
     puts  "#{i}. #{notice.title}"
     puts notice.summary
     puts notice.readmore

   end
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
