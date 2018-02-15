# Article name, summary, and URL
class Article
  attr_accessor :name, :summary, :url, :full_story, :date, :tags

  def initialize(name, summary, url, date, tag_names)
    self.name = name.delete("\n")
    self.summary = summary
    self.url = url
    self.date = date
    self.tags = []
    add_tags(tag_names)
  end

  def display
    y, m, d, _h, _min, _s = date
    puts name
    puts "#{y} #{m} #{d}"
    puts full_story ? full_story : summary
    puts '---'
    puts
  end

  def add_tags(tag_names)
    tag_names.each do |tag_name, tag_url|
      tag = Tag.new(tag_name, tag_url, self)
      tags << tag
    end
  end
end
