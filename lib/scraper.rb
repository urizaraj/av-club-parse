# Scrapes AV Club newswire page
class Scraper
  def self.fetch_doc(url)
    html = open(url)
    Nokogiri::HTML(html)
  end

  def self.scrape_index_page(start_time = 0)
    url = 'https://www.avclub.com/c/newswire'
    url << "?startTime=#{start_time}" unless start_time.zero?
    doc = fetch_doc(url)

    main = doc.css('section.main .main__content .storytype__content article')

    main.map { |element| scrape_index_element(element) }
  end

  def self.scrape_index_element(element)
    title = element.css('.headline.entry-title a')
    name = title.text
    url = title.attribute('href').value

    date = get_date_array(element)
    summary = element.css('.excerpt.entry-summary p').text
    tags = get_tag_array(element)

    [name, summary, url, date, tags]
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

  def self.get_tag_array(element)
    # #taglist-1823034471 > div > ul > li:nth-child(2) > a
    links = element.css(
      'header .meta--pe .meta__container .post-tags-container .post-taglist a'
    )

    links.map do |link|
      name = link.text
      url_name = link.attribute('data-urlname').value
      [name, url_name]
    end
  end
end
