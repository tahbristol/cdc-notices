require_relative '../scrape_notice'
require_relative '../notice.rb'
class CdcNotices::CLI



  def initialize
    puts "Welcome to the CDC Notice Library."
    site = Scraper.new("https://wwwnc.cdc.gov/travel/notices")
    @notice = site.set_attributes

  end

  def call
  #html = open("https://wwwnc.cdc.gov/travel/notices", ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE)

  input = ""
  while input != "exit"
    puts "What would you like to do?"
    input = gets.strip
    case input
    when "all"
      all_notices
    when "exit"
      puts "Goodbye"
      break
    else
    end
  end
end


def all_notices
@notice.notices
end

def browse_readmore(index)
  index = index.to_i - 1
    system(open(@notice.notices[index]))
end





end
