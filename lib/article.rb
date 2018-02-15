# Article name, summary, and URL
class Article
  attr_accessor :name, :summary, :url, :full_story, :date

  @@all = []

  def initialize(name, summary, url, date)
    self.name = name
    self.summary = summary
    self.url = url
    self.date = date

    self.class.all << self
  end

  def self.all
    @@all
  end

  def self.display_all
    all.each do |article|
      y, m, d, h, min, s = article.date
      puts article.name
      puts "#{y} #{m} #{d}"
      puts article.full_story ? article.full_story : article.summary
      puts '---'
      puts
    end
  end
end
