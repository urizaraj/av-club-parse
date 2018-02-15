# Scrapes AV Club newswire page
class Scraper
  def self.scrape_index_page
    html = open('https://www.avclub.com/c/newswire')
    doc = Nokogiri::HTML(html)

    main = doc.css('section.main .main__content .storytype__content article')

    main.each do |element|
      title = element.css('.headline.entry-title a')
      name = title.text
      url = title.attribute('href').value

      summary = element.css('.excerpt.entry-summary p')

      Article.new(name, summary, url)
    end
  end
end
