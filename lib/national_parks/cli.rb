require 'pry'
require_relative 'park'
require_relative 'scraper'

class NationalParks::CLI


  def run
    NationalParks::Scraper.make_parks
    call
  end

  def call
    start
    list_parks
  end

  def start
    puts <<-DISPLAY
         |--------------------------------------------------------------------|
         |                                                   © 2020 Adam Horn |
         |                                                                    |
         |                     Welcome to the NPS data gem!                   |
         |                          _________________                         |
         |                          (               )                         |
         |                    _______(             )_______                   |
         |                    (                           )                   |
         |                     (      National           )                    |
         |                      (                       )                     |
         |                       (       Park          )                      |
         |                        (                   )                       |
         |                         (       Service   )                        |
         |                          (               )                         |
         |                           (             )                          |
         |                            (_         _)                           |
         |                              (_     _)                             |
         |                                (___)                               |
         |                                                                    |
         |                   Here is a list of National Parks                 |
         |                        in the United States:                       |
         |                                                                    |
         |--------------------------------------------------------------------|
        DISPLAY
        sleep(5)
  end

  def list_parks

    NationalParks::Park.all.each.with_index(1){|park,index| puts <<-DISPLAY
         |--------------------------------------------------------------------|
                    #{index}. #{park.name}
         |--------------------------------------------------------------------|
        DISPLAY
        }
    menu
  end

  def menu
    puts <<-DISPLAY
        |---------------------------------------------------------------------|
        |            Enter the number of a park to see details                |
        |---------------------------------------------------------------------|
       DISPLAY

    @i = gets.to_i
    @park = NationalParks::Park.all[@i-1]
    puts <<-DISPLAY
         |--------------------------------------------------------------------|
         |                                                   © 2020 Adam Horn |
         |                                                                    |
                        Welcome to #{@park.name}!
         |                          _________________                         |
         |                          (               )                         |
         |                    _______(             )_______                   |
         |                    (                           )                   |
         |                     (      National           )                    |
         |                      (                       )                     |
         |                       (       Park          )                      |
         |                        (                   )                       |
         |                         (       Service   )                        |
         |                          (               )                         |
         |                           (             )                          |
         |                            (_         _)                           |
         |                              (_     _)                             |
         |                                (___)                               |
         |                                                                    |
         |                                                                    |
         |--------------------------------------------------------------------|
        DISPLAY
    park_menu
  end

  def pl_list
    sleep(2)
    puts <<-DISPLAY
         |--------------------------------------------------------------------|
         |                                                                    |
         |                                                                    |
         | To see its location, enter 'location'                              |
         |                                                                    |
         | To see a brief description of the park, enter 'description'        |
         |                                                                    |
         | To see a more detailed informational section, enter 'information'  |
         |                                                                    |
         | To see a description of the climate in the park, enter 'weather'   |
         |                                                                    |
         | To see information on tours and camping , enter 'tours and camping'|
         |                                                                    |
         | To see information on wildlife in the park, enter 'wildlife'       |
         |                                                                    |
         | To see nearby parks and historic sites/trails, enter 'nearby parks'|
         |                                                                    |
         | To see the list of parks again, enter 'list'                       |
         |                                                                    |
         | To exit, enter 'exit'                                              |
         |                                                                    |
         | What information would you like about #{@park.name}
         |                                                                    |
         |--------------------------------------------------------------------|
        DISPLAY
  end

  def park_menu

    pl_list

    input = ""
    puts input
    while input != "exit"

      input = gets.strip.downcase

      case input
      when "location"
        puts <<-DISPLAY
         |--------------------------------------------------------------------|
          #{@park.location}
         |--------------------------------------------------------------------|
         |                Press enter to return to park menu                  |
         |--------------------------------------------------------------------|
        DISPLAY
        input_2 = gets.strip
        input_2 = "enter"
        case input_2
        when "enter"
          pl_list
        end
      when "description"
        puts <<-DISPLAY
         |--------------------------------------------------------------------|
          #{@park.description}
         |--------------------------------------------------------------------|
         |                Press enter to return to park menu                  |
         |--------------------------------------------------------------------|
        DISPLAY
        input_2 = gets.strip
        input_2 = "enter"
        case input_2
        when "enter"
          pl_list
        end
      when "information"
        puts <<-DISPLAY
         |--------------------------------------------------------------------|
          #{@park.information}
         |--------------------------------------------------------------------|
         |                Press enter to return to park menu                  |
         |--------------------------------------------------------------------|
        DISPLAY
        input_2 = gets.strip
        input_2 = "enter"
        case input_2
        when "enter"
          pl_list
        end
      when "weather"
        puts <<-DISPLAY
         |--------------------------------------------------------------------|
          #{@park.weather}
         |--------------------------------------------------------------------|
         |                Press enter to return to park menu                  |
         |--------------------------------------------------------------------|
        DISPLAY
        input_2 = gets.strip
        input_2 = "enter"
        case input_2
        when "enter"
          pl_list
        end
      when "tours and camping"
        puts <<-DISPLAY
         |--------------------------------------------------------------------|
          #{@park.tours_and_camping}
         |--------------------------------------------------------------------|
         |                Press enter to return to park menu                  |
         |--------------------------------------------------------------------|
        DISPLAY
        input_2 = gets.strip
        input_2 = "enter"
        case input_2
        when "enter"
          pl_list
        end
      when "wildlife"
        puts <<-DISPLAY
         |--------------------------------------------------------------------|
          #{@park.wildlife}
         |--------------------------------------------------------------------|
         |                  Press enter to return to park menu                |
         |--------------------------------------------------------------------|
        DISPLAY
        input_2 = gets.strip
        input_2 = "enter"
        case input_2
        when "enter"
          pl_list
        end
      when "nearby parks"
        puts <<-DISPLAY
         |--------------------------------------------------------------------|
          #{@park.nearby_parks[0]}
          #{@park.nearby_parks[1]}
          #{@park.nearby_parks[2]}
         |--------------------------------------------------------------------|
         |                  Press enter to return to park menu                |
         |--------------------------------------------------------------------|
        DISPLAY
        input_2 = gets.strip
        input_2 = "enter"
        case input_2
        when "enter"
          pl_list
        end
      when "list"
        list_parks
        break
      when String != "exit"
        puts <<-DISPLAY
         |--------------------------------------------------------------------|
         |          Not sure what that means, give it another shot            |
         |--------------------------------------------------------------------|
        DISPLAY
        pl_list
      when "exit"
        input = "exit"
        goodbye
        break
      end
    end
  end

  def goodbye
    puts <<-DISPLAY
         |--------------------------------------------------------------------|
         |                                                   © 2020 Adam Horn |
         |                                                                    |
         |                            Happy Trails!                           |
         |                          _________________                         |
         |                          (               )                         |
         |                    _______(             )_______                   |
         |                    (                           )                   |
         |                     (      National           )                    |
         |                      (                       )                     |
         |                       (       Park          )                      |
         |                        (                   )                       |
         |                         (       Service   )                        |
         |                          (               )                         |
         |                           (             )                          |
         |                            (_         _)                           |
         |                              (_     _)                             |
         |                                (___)                               |
         |                                                                    |
         |                                                                    |
         |--------------------------------------------------------------------|
        DISPLAY
  end
end
