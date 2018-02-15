# Article name, summary, and URL
class Article
  attr_accessor :name, :summary, :url, :full_story

  @@all = []

  def initialize(name, summary, url)
    self.name = name
    self.summary = summary
    self.url = url

    self.class.all << self
  end

  def self.all
    @@all
  end

  def self.display_all
    all.each do |article|
      puts article.name
      puts article.full_story ? article.full_story : article.summary
      puts '---'
      puts
    end
  end
end
