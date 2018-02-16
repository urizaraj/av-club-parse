# Article name, summary, and URL
class Article
  attr_accessor :name, :summary, :url, :full_story, :date, :tags

  def initialize(name, summary, url, date)
    self.name = name.delete("\n")
    self.summary = summary
    self.url = url
    self.date = date
    self.tags = []
  end

  def display
    puts name
    puts url
    puts date_string
    puts tags_string
    puts
    puts full_story ? full_story : summary
    puts
  end

  def add_tag(tag)
    tags << tag
    tag.add_article(self)
  end

  def tags_string
    tags.map(&:url).join(' ')
  end

  def date_string
    y, m, d, _h, _min, _s = date
    "#{m}/#{d}/#{y}"
  end
end
