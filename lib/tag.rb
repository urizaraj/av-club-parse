# Class for Article tags
class Tag
  attr_accessor :name, :url, :articles
  def initialize(name, url, article)
    self.name = name
    self.url = url
    self.articles = [article]
  end
end
