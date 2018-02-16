class AVParseCommandLine
  attr_accessor :avparser
  def initialize
    self.avparser = AVParser.new
  end

  def start
    avparser.start
  end
end
