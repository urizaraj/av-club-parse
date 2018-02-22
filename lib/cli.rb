# class to interact with AVClubParser on command line
class AVParseCommandLine
  attr_accessor :avparser

  def initialize
    self.avparser = AVParser.new
  end

  def start
    avparser.start
    puts 'Welcome to the AV Club newswire parser!'
    puts 'Type "help" to see a list of commands.'
    puts
    main_loop
  end

  def main_loop
    loop do
      input = gets.strip.split
      puts
      if input[0] == 'titles'
        titles

      elsif input[0] == 'article'
        article(input[1].to_i)

      elsif input[0] == 'more'
        more

      elsif input[0] == 'tags'
        tags

      elsif input[0] == 'all'
        all

      elsif input[0] == 'tag'
        tag(input[1])

      elsif input[0] == 'help'
        help

      elsif input[0] == 'quit'
        break
      end
    end
  end

  def titles
    avparser.display_titles
  end

  def article(i)
    valid = avparser.display_article(i)
    puts "Invalid article\n\n" unless valid
  end

  def more
    print 'loading more articles... '
    avparser.more_articles
    print 'done!'
    puts
    puts
  end

  def tags
    avparser.display_tags
  end

  def all
    print 'loading all articles... '
    avparser.full_story_all
    print 'done!'
    puts
    puts
  end

  def tag(i)
    valid = avparser.display_single_tag(i)
    puts "Invalid tag\n\n" unless valid
  end

  def help
    puts 'Commands: '
    puts 'titles'
    puts 'article [number]'
    puts 'more'
    puts 'all'
    puts 'tags'
    puts 'tag [tag name]'
    puts 'quit'
    puts 'help'
    puts
  end
end
