# Main class to control scraper and articles
class AVParser
  attr_accessor :all_articles, :all_tags

  def initialize
    self.all_articles = []
    self.all_tags = []
  end

  def start
    scrape_articles
  end

  def scrape_articles(start_time = 0)
    article_info = Scraper.scrape_index_page(start_time)

    article_info.each do |info_array|
      article = Article.new(*info_array)
      all_articles << article
    end
  end

  def more_articles
    last_date = all_articles[-1].date
    start_time = (Time.local(*last_date).to_i + 60 - 3600) * 1000
    scrape_articles(start_time)
  end

  def full_story(article)
    full_story_array, tag_array = Scraper.scrape_article(article.url)
    update_tags(tag_array, article)
    article.full_story = full_story_array
  end

  def full_story_all
    all_articles.each { |article| full_story(article) }
  end

  def update_tags(tag_names, article)
    tag_names.each do |tag_name, tag_url|
      tag, isnew = find_or_create_tag(tag_name, tag_url)
      all_tags << tag if isnew
      article.add_tag(tag)
    end
  end

  def find_or_create_tag(tag_name, tag_url)
    old_tag = all_tags.find { |tag| tag.url == tag_url }
    old_tag ? [old_tag, false] : [Tag.new(tag_name, tag_url), true]
  end

  def display_titles
    all_articles.each_with_index do |article, index|
      puts "[#{index}] #{article.name}"
    end
    puts
  end

  def display_articles
    all_articles.each(&:display)
  end

  def display_article(i)
    article = all_articles[i]
    full_story(article) unless article.full_story
    article.display
  end

  def display_tags
    n = 1
    all_tags
      .sort_by { |e| [e.size * -1, e.url] }
      .each do |tag|
      print " #{tag.url} [#{tag.articles.size}] "
      puts if (n % 3).zero?
      n += 1
    end
    puts
  end
end
