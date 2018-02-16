# class to interact with AVClubParser on command line
class AVParseCommandLine
  attr_accessor :avparser

  def initialize
    self.avparser = AVParser.new
  end

  def start
    avparser.start
    puts 'welcome to the av club newswire parser'
    main_loop
  end

  def main_loop
    loop do
      input = gets.strip.split
      puts
      if input == %w[display titles]
        avparser.display_titles
      elsif input[0..1] == %w[display article]
        avparser.display_article(input[2].to_i)
      else
        break
      end
    end
  end
end
