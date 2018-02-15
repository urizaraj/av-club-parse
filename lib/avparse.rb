class AVParser
  attr_accessor :all_articles

  def initialize
    self.all_articles = []
  end

  def start
    article_info = Scraper.scrape_index_page

    article_info.each do |value|
      article = Article.new(*value)
      all_articles << article
    end
  end

  def display_articles
    all_articles.each(&:display)
  end
end
