# Scrapes AV Club newswire page
class Scraper
  def self.fetch_doc(url)
    html = open(url)
    Nokogiri::HTML(html)
  end

  def self.scrape_index_page
    base = 'https://www.avclub.com/c/newswire'
    doc = fetch_doc(base)

    main = doc.css('section.main .main__content .storytype__content article')

    main.map do |element|
      title = element.css('.headline.entry-title a')
      name = title.text
      url = title.attribute('href').value

      date = get_date_array(element)
      summary = element.css('.excerpt.entry-summary p').text

      [name, summary, url, date]
    end
  end

  def self.get_date_array(element)
    time = element.css('time').attribute('datetime').value
    date = time.scan(/(\d{4})-(\d{2})-(\d{2})T(\d{2}):(\d{2}):(\d{2})/)
    date.flatten
  end

  def self.scrape_article(url)
    doc = fetch_doc(url)

    paragraphs = doc.css('.post-content.entry-content.js_entry-content p')

    paragraphs.map(&:text)
  end
end
