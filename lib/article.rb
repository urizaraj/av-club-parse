# Article name, summary, and URL
class Article
  attr_accessor :name, :summary, :url, :full_story, :date

  def initialize(name, summary, url, date)
    self.name = name.delete("\n")
    self.summary = summary
    self.url = url
    self.date = date
  end

  def display
    y, m, d, _h, _min, _s = date
    puts name
    puts "#{y} #{m} #{d}"
    puts full_story ? full_story : summary
    puts '---'
    puts
  end
end
