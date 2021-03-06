require_relative '../scrape_notice.rb'
require_relative '../notice.rb'
require 'launchy'
class CdcNotices::CLI



  def initialize
    puts "Welcome to the CDC Notice Library."
    site = Scraper.new("https://wwwnc.cdc.gov/travel/notices")
    @notice = site.set_attributes

  end

  def call

    input = ""
    while input != "exit"
      puts "What would you like to do?"
      puts "Press help for a list of commands"
      input = gets.strip
        case input
        when "help"
          puts "*****************************"
          puts "all: Display all notices"
          puts "alerts: Display alerts only."
          puts "warnings: Display warnings only."
          puts "watches: Display watches only."
          puts "readmore: open readmore in browser. 'readmore' press enter then enter the number corresponding to the notice you want"
          puts "exit: exit the application"
          puts "******************************"
        when "all"
          all_notices
        when "alerts"
          alert_notices
        when "warnings"
          warning_notices
        when "watches"
          watch_notices
        when "readmore"
          readmore
        when "exit"
          puts "Goodbye"
          break
        else
        end
      end
    end


  def readmore
    puts "Which notice would you like to read?"
    input = gets.strip
    input = input.to_i - 1
    Launchy.open("#{@notice.notices[input].readmore}")


  end

  def all_notices
  @notice.display_notices
  end

  def alert_notices
    @notice.display_alerts
  end

  def warning_notices
    @notice.display_warnings
  end

  def watch_notices
    @notice.display_watches
  end







end
