class Scraper
  def self.scrape_index_page(_index_url)
    html = open('https://www.avclub.com/c/newswire')
    doc = Nokogiri::HTML(html)
  end
end
