# Main class to control scraper and articles
class AVParser
  attr_accessor :all_articles

  def initialize
    self.all_articles = []
  end

  def start
    scrape_articles
  end

  def scrape_articles(start_time = 0)
    article_info = Scraper.scrape_index_page(start_time)

    article_info.each do |value|
      article = Article.new(*value)
      all_articles << article
    end
  end

  def display_articles
    all_articles.each(&:display)
  end

  def more_articles
    last_date = all_articles[-1].date
    start_time = (Time.local(*last_date).to_i + 60 - 3600) * 1000
    scrape_articles(start_time)
  end

  def full_story(article)
    full_story = Scraper.scrape_article(article.url)
    article.full_story = full_story
  end

  def display_titles
    all_articles.each_with_index do |article, index|
      puts "[#{index}] #{article.name}"
    end
  end
end
