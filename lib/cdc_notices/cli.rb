require_relative '../scrape_notice'
class CdcNotices::CLI

  def call
    site = Scraper.new("https://wwwnc.cdc.gov/travel/notices")
    site.get_page
    page = site.set_attributes

    puts "CURRENT NOTICES"
    puts "Current Notices
Travel notices are designed to inform travelers and clinicians about current health issues related to specific destinations. These issues may arise from disease outbreaks, special events or gatherings, natural disasters, or other conditions that may affect travelers’ health. See below for more information on our travel notice categories.

For country-specific information about Safety and Security, visit the US Department of State Travel Alerts and Warnings page.

For country-specific information about weather conditions, visit the National Oceanic and Atmospheric Administration (NOAA) International Weather Selector webpage.

For a list of all Zika virus travel notices by region, visit Zika travel information."
    puts "Would you like to get the current notices? [y/n]"
    input = gets.downcase.strip
    if input === "y"
      puts "Alert Level 2, Practice Enhanced Precautions"
      puts "Hajj and Umrah in Saudi Arabia"
      puts "April 14, 2017"
      puts "The annual Hajj, or pilgrimage to Mecca, Saudi Arabia, is among the largest mass gatherings in the world. Because of the crowds, mass gatherings such as Hajj and Umrah are associated with unique health risks. Before you go, you should visit a travel health specialist for advice, make sure you are up to date on all routine and recommended vaccines, and learn about other health and safety issues that could affect you during your trip."
    end
  end

end
