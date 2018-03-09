# class to interact with AVClubParser on command line
class AVParseCommandLine
  attr_accessor :avparser, :complete, :arg

  COMMANDS = {
    titles: :titles,
    article: :article,
    more: :more,
    tags: :tags,
    all: :all,
    tag: :tag,
    help: :help,
    quit: :quit
  }.freeze

  def initialize
    self.avparser = AVParser.new
    self.complete = false
    self.arg = nil
  end

  def start
    avparser.start
    puts 'Welcome to the AV Club newswire parser!'
    puts 'Type "help" to see a list of commands.'
    puts
    main_loop until complete
  end

  def main_loop
    command, self.arg = gets.strip.split
    puts

    return unless command

    command = command.to_sym
    send(COMMANDS[command]) if COMMANDS.key?(command)
  end

  def titles
    avparser.display_titles
  end

  def article
    i = arg.to_i
    # valid = avparser.display_article(i)
    # puts "Invalid article\n\n" unless valid
    article = avparser.find_article(i)

    puts article.name
    puts article.url
    puts article.date_string
    puts article.tags_string
    puts
    puts article.full_story ? article.full_story : article.summary
    puts
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

  def tag
    valid = avparser.display_single_tag(arg)
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

  def quit
    self.complete = true
  end
end
