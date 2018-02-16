# class to interact with AVClubParser on command line
class AVParseCommandLine
  attr_accessor :avparser

  def initialize
    self.avparser = AVParser.new
  end

  def start
    avparser.start
    puts 'welcome to the av club newswire parser'
    get_input
  end

  def get_input
    loop do
      input = gets.strip.split
      puts
      avparser.display_titles if input[0] == 'display' && input[1] == 'titles'
      avparser.display_article(input[2].to_i) if input[0] == 'display' && input[1] == 'article'
      break if input.size.zero?
    end
  end
end
