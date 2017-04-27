require_relative 'scrape_notice.rb'
class Notice

  attr_accessor :notice_date

  def initialize
    @notices = []
    @alert_notices = []
    @warning_notices = []
    @watch_notices = []
  end

  def display_all_notices
    self.notices.each.with_index(1) do |notice,i|
      puts "**************************"
      puts  "#{i}. #{notice.title}"
      puts notice.summary
      puts notice.readmore
    end

  end

  def notices
    @notices
  end


  def add_alert(alert)
    @notices << alert
  end

  def add_watch(watch)
    @watch_notices << watch
  end

  def add_warning(warning)
    @warning_notices << warning
  end



end
