require_relative '../scrape_notice'
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
      puts "readmore: open readmore in browser. 'readmore' press enter then enter the number corresponding to the notice you want"
      puts "exit: exit the application"
      puts "******************************"
    when "all"
      all_notices
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






end
