class Scraper
  def self.scrape_index_page
    html = open('https://www.avclub.com/c/newswire')
    doc = Nokogiri::HTML(html)

    main = doc.css('section.main .main__content .storytype__content article')

    main.each do |element|
      puts element.css('.headline.entry-title a').text
    end
  end
end
