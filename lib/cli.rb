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
        valid = avparser.display_article(input[1].to_i)
        puts 'Invalid article' unless valid
        puts
      elsif input[0] == 'more'
        print 'loading more articles... '
        avparser.more_articles
        print 'done!'
        puts
        puts
      elsif input[0] == 'tags'
        avparser.display_tags
      elsif input[0] == 'all'
        print 'loading all articles... '
        avparser.full_story_all
        print 'done!'
        puts
        puts
      elsif input[0] == 'tag'
        avparser.display_single_tag(input[1])
      elsif input[0] == 'quit'
        break
      end
    end
  end
end
