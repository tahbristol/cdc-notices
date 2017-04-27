require_relative 'scrape_notice.rb'
class Notice

  attr_accessor :notice_date

  def initialize
    @alert_notices = []
    @warning_notices = []
    @watch_notices = []
  end

  def display_notices
    @notices.each.with_index(1) do |notice,i|
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
    @aler_notices << alert
  end
  def add_warning(warning)
    @warning_notices << warning
  end
  def add_alert(watch)
    @watch_notices << watch
  end



=begin
@@notices = []
  def initialize(notice_hash=nil)
    @title = notice_hash[:title]
    @content = notice_hash[:summary]
    @readmore_url = notice_hash[:readmore]
    @@notices << self
    end


  def self.notices

    @@notices
  end

  def display
    puts "****************************************************"
    puts "#{self.title}"
    puts "#{self.content}"
    puts "#{self.readmore_url}"
=end

end
