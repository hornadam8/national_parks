require 'pry'
require_relative 'park'
require_relative 'scraper'

class NationalParks::CLI


  def run
    NationalParks::Scraper.make_parks
    call
  end


  def call
    puts "Welcome to the NPS data gem!"
    puts "Here is a list of national parks in the United States"
    list_parks
    menu
  end

  def menu
    puts "Please enter the number of a park for more information"

    @i = gets.to_i
    park = NationalParks::Park.all[@i-1]
    puts "Welcome to #{park.name}!"
    park_menu
  end

  def park_menu

    park = NationalParks::Park.all[@i-1]

    input = ""
    while input != "exit"
      sleep(2)
      puts "To see its location, enter 'location'"
      puts "To see a brief description of the park, enter 'description'"
      puts "To see a more detailed informational section, enter 'information'"
      puts "To see a description of climate/typical weather in the park, enter 'weather'"
      puts "To see information on tours and camping , enter 'tours and camping'"
      puts "To see information on wildlife in the park, enter 'wildlife'"
      puts "To see the list of parks again, enter 'list'"
      puts "To exit, enter 'exit'"
      puts "What information would you like about #{park.name}"

      input = gets.strip.downcase

      case input
      when "location"
        puts "#{park.location}"
        puts "Press any key to return to the menu"
        input = gets.strip
        input = "enter"
        case input
        when "enter"
          park_menu
        end
      when "description"
        puts "#{park.description}"
        puts "Press any key to return to the menu"
        input = gets.strip
        input = "enter"
        case input
        when "enter"
          park_menu
        end
      when "information"
        puts "#{park.information}"
        puts "Press any key to return to the menu"
        input = gets.strip
        input = "enter"
        case input
        when "enter"
          park_menu
        end
      when "weather"
        puts "#{park.weather}"
        puts "Press any key to return to the menu"
        input = gets.strip
        input = "enter"
        case input
        when "enter"
          park_menu
        end
      when "tours and camping"
        puts "#{park.tours_and_camping}"
        puts "Press any key to return to the menu"
        input = gets.strip
        input = "enter"
        case input
        when "enter"
          park_menu
        end
      when "wildlife"
        puts "#{park.wildlife}"
        puts "Press any key to return to the menu"
        input = gets.strip
        input = "enter"
        case input
        when "enter"
          park_menu
        end
      when "list"
        list_parks
      else
        puts "Not sure what that means, give it another shot"
        park_menu
      end
    end
    goodbye
  end

  def list_parks
    NationalParks::Park.all.each.with_index(1){|park,index| puts "#{index}. #{park.name}"}
    menu
  end

  def goodbye
    puts "Happy trails!"
  end

end
