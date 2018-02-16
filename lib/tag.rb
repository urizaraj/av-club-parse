# Class for Article tags
class Tag
  attr_accessor :name, :url, :articles, :size

  def initialize(name, url)
    self.name = name
    self.url = url
    self.articles = []
    self.size = 0
  end

  def add_article(article)
    articles << article
    self.size += 1
  end

  def display
    puts url
    puts
    articles.each { |article| puts article.name }
  end
end
