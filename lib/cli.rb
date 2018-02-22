# class to interact with AVClubParser on command line
class AVParseCommandLine
  attr_accessor :avparser, :complete

  def initialize
    self.avparser = AVParser.new
    self.complete = false
  end

  def start
    avparser.start
    puts 'Welcome to the AV Club newswire parser!'
    puts 'Type "help" to see a list of commands.'
    puts
    main_loop until complete
  end

  def main_loop
    command, arg = gets.strip.split
    puts
    if command == 'titles'
      titles

    elsif command == 'article'
      article(arg.to_i)

    elsif command == 'more'
      more

    elsif command == 'tags'
      tags

    elsif command == 'all'
      all

    elsif command == 'tag'
      tag(arg)

    elsif command == 'help'
      help

    elsif command == 'quit'
      self.complete = true
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
