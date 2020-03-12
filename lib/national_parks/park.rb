require_relative 'scraper'
require_relative 'cli'
require 'pry'

class NationalParks::Park

  attr_accessor :name, :link, :location, :description, :information, :weather, :tours_and_camping, :wildlife

  @@all = []

  def self.all
    @@all
  end

  def initialize(name=nil,link=nil)
    if name.include?("National Park")
      @name = name.rstrip
      @link = link
      self.scrape_park_page
      @@all << self
    end
  end



  def scrape_park_page

    page = NationalParks::Scraper.get_park_page(self.link).css(".fieldset-wrapper")

    location = page[3]

    if location.children.to_a.length >= 2
      if location.children[1].children[3].children[3].children[3].children.to_a.length > 1
        line_1 = location.children[1].children[3].children[3].children[3].children[1].children[0].text
        line_2 = location.children[1].children[3].children[3].children[3].children[3]
        if line_2
          #Group of parks?(#2 Arches confirmed) with an extra piece of info(Box#)
          line_2_sub = line_2.children[0].text.gsub("\n","").chomp(" ")
          line_3 = location.children[1].children[3].children[3].children[5].children.text.gsub("\n","").chomp(" ")
          line_4 = location.children[1].children[3].children[3].children[7].children[0].text
          self.location = "#{line_1} #{line_2_sub},  #{line_3}, #{line_4}"
        else
          #Most Parks
          alt_line_2 = location.children[1].children[3].children[3].children[5].children.text.gsub("\n","").chomp(" ")
          alt_line_3 = location.children[1].children[3].children[3].children[7].text
          self.location = "#{line_1},  #{alt_line_2}, #{alt_line_3}"
        end
      elsif location.children[1].children[3].children[3].children.to_a.length > 5
        #49.RMNP (Page built differently, children is a single array[as opposed to arrays separated by commas])
        line_1 = location.children[1].children[3].children[3].children[1].children[1].children.text
        line_2 = location.children[1].children[3].children[3].children[3].children.text.gsub("\n","").chomp(" ")
        line_3 = location.children[1].children[3].children[3].children[5].children.text
        self.location = "#{line_1},  #{line_2}, #{line_3}"
      else
        #56.WSNP (Built differently because location is an AF base and therefore doesnt have a street address)
        line_1 = location.children[1].children[3].children[3].children[1].children.text.gsub("\n","").chomp(" ")
        line_2 = location.children[1].children[3].children[3].children[3].children[0].text
        self.location = "#{line_1}, #{line_2}"
      end
    else
      #Group of parks?(#6. BCGNP confirmed) children is a single
      line_1 = location.children[0].children[3].children[3].children[3].children[1].text
      line_2 = location.children[0].children[3].children[3].children[5].children.text.gsub("\n","").chomp(" ")
      line_3 = location.children[0].children[3].children[3].children[7].children[0].text
      self.location = "#{line_1},  #{line_2}, #{line_3}"
    end

    self.description = page[0].children[3].children.text.chomp("\n")

    information = page[0].children[11]

    if information
      self.information = information.children.text.gsub("\n","").strip.split("   ")[0]
    else
      self.information = page[0].text.gsub("\n","").strip.split("   ")[0].split("Information")[1]
    end

    if self.name == "Rocky Mountain National Park"
      self.information += "BONUS: The developer of this gem lives 40 minutes
      from the eastern entrance and highly suggests a hike at Lilly Lake for
      a great view of Longs Peak!"
    end

    weather = page[3].children[0].children[0].children[2]

    if weather
      self.weather = weather.children[1].children[0].text
    else
      self.weather = "There is no information available on the weather for this park."
    end

    tours_and_camping = page[3].children[0].children[1].children[2]

    if tours_and_camping
      self.tours_and_camping = tours_and_camping.children.text.gsub("\n","")
    else
      self.tours_and_camping = "There is no information available on the tours and camping in this park."
    end

    wildlife = page[3].children[0]

    if wildlife.children.to_a.length >= 3
      if wildlife.children[2].children.to_a.length >= 3
        self.wildlife = wildlife.children[2].children[2].children[1].children.text
      else
        #pages that have no wildlife section (and they're missing other info too i.e.
        #6 BCGNP, which has almost none of it's info on the page)
        self.wildlife = "There is no information available on wildlife in this park."
      end
    else
      #specifically Joshua Tree, which has no wildlife section
      self.wildlife = "There is no information available on wildlife in this park."
    end




  end

end
