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
      puts "***************************"
      puts "There are no current notices."
      puts "***************************"
    else
      self.notices.each.with_index(1) do |notice,i|
        puts "**************************"
        puts  "#{i}. #{notice.title}"
        puts notice.summary
        puts notice.readmore
      end
    end
  end

   def display_alerts
     if self.alerts.empty?
       puts "***************************"
       puts "There are no current alerts."
       puts "***************************"
     else
        self.alerts.each.with_index(1) do |notice,i|
          puts "**************************"
          puts  "#{i}. #{notice.title}"
          puts notice.summary
          puts notice.readmore
        end
      end
    end

  def display_warnings
    if self.warnings.empty?
      puts "***************************"
      puts "There are no current warnings."
      puts "***************************"
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
      puts "***************************"
      puts "There are no current watches."
      puts "***************************"
    else
       self.watches.each.with_index(1) do |notice,i|
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
