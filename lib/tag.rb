# Class for Article tags
class Tag
  attr_accessor :name, :url, :articles

  def initialize(name, url)
    self.name = name
    self.url = url
    self.articles = []
  end

  def add_article(article)
    articles << article
  end
end
