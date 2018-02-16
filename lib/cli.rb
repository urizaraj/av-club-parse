# class to interact with AVClubParser on command line
class AVParseCommandLine
  attr_accessor :avparser

  def initialize
    self.avparser = AVParser.new
  end

  def start
    avparser.start
    puts 'welcome to the av club newswire parser'
    puts
    main_loop
  end

  def main_loop
    loop do
      input = gets.strip.split
      puts
      if input[0] == 'titles'
        avparser.display_titles
      elsif input[0] == 'article'
        avparser.display_article(input[1].to_i)
      elsif input[0] == 'more'
        print 'loading...'
        avparser.more_articles
        print 'done'
        puts
      elsif input[0] == 'tags'
        avparser.display_tags
      else
        break
      end
    end
  end
end
