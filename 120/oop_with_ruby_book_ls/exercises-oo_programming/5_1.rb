# Banner Class
# Behold this incomplete class for constructing boxed banners.

class Banner
  DEFAULT_WIDTH = 1

  attr_reader :messages

  def initialize(message, width=DEFAULT_WIDTH)
    @message = message
    @width = width
  end

  def to_s
    if @width <= 0 || @width > 21
      puts 'Width is to narrow/wide,choose a numer greater than 0 and smaller than 20'
      puts "retuning the default width '#{DEFAULT_WIDTH}'"
    end
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def width(str)
    if @width <= 0 || @width > 21
      str * DEFAULT_WIDTH
    else
      str * @width
    end
  end

  def txt_sz(str)
    str * @message.size
  end

  def horizontal_rule
    '+' + width('-') + txt_sz('-') + width('-') + '+'
  end

  def empty_line
    '|' + width(' ') + txt_sz(' ') + width(' ') + '|'
  end

  def message_line
    '|' + width(' ') + @message + width(' ') + '|'
  end
end

# Complete this class so that the test cases shown below work as intended.
# You are free to add any methods or instance variables you need. However,
# do not make the implementation details public.

# You may assume that the input will always fit in your terminal window.

# Test Cases

banner = Banner.new('To boldly go where no one has gone before.')
puts banner
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+
banner = Banner.new('To boldly go where no one has gone before.', 10)
puts banner
# +----------------------------------------------------------------+
# |                                                                |
# |           To boldly go where no one has gone before.           |
# |                                                                |
# +----------------------------------------------------------------+

banner = Banner.new('')
puts banner
# +--+
# |  |
# |  |
# |  |
# +--+

# Further Exploration
# Modify this class so new will optionally let you specify a fixed banner width
# at the time the Banner object is created. The message in the banner should be
# centered within the banner of that width. Decide for yourself how you want to
# handle widths that are either too narrow or too wide.

banner = Banner.new('To boldly go where no one has gone before.', -1)
puts banner

banner = Banner.new('To boldly go where no one has gone before.', 100)
puts banner
