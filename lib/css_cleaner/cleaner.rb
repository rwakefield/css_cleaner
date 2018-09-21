# Replace all whitespace with one space and then put new lines in spots so that
# the css is in block format.

class Cleaner
  def initialize(css_string:)
    @css_string = css_string
  end

  def clean
    make_all_whitespace_a_space
    css_string.split(' ').map { |css_part| clean_string_part_and_return(css_part) }.join('').strip
  end

  private

  attr_accessor :css_string

  def make_all_whitespace_a_space
    css_string.gsub!(/\s+/, ' ')
  end

  def clean_string_part_and_return(string_part)
    string_part.gsub!('{', " {\n")
    string_part.gsub!('}', "}\n\n")
    string_part.gsub!(';', ";\n")
    string_part = "  #{string_part} " if string_part.include?(':')
    string_part
  end
end
