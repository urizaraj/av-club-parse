class Article
  attr_accessor :name, :summary, :url

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
end
