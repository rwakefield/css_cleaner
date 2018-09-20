# replace all whitespace with one space and then put new lines in spots so that
# the css is in block format.
#
#   GIVEN: p {        color:     blue   ; }
#
#   OUTPUT:
#     p {
#       color: blue;
#     }

class CssStringCleaner
  def initialize(css_string:)
    @css_string = css_string
  end

  def clean
    remove_front_and_back_space
    make_all_whitespace_a_space
    put_two_spaces_in_front_of_css_properties
    put_new_lines_around_braces
    put_new_lines_after_properties
    squeeze_new_lines_into_one_line
    css_string
  end

  private

  attr_accessor :css_string

  def remove_front_and_back_space
    css_string.strip!
  end

  def make_all_whitespace_a_space
    css_string.gsub!(/\s+/, ' ')
  end

  def put_two_spaces_in_front_of_css_properties
    @css_string = css_string.split(' ').map { |word| word.include?(':') ? " #{word}" : word }.join(' ')
  end

  def put_new_lines_around_braces
    css_string.gsub!('{', "{\n")
    css_string.gsub!(' }', "}\n")
  end

  def put_new_lines_after_properties
    css_string.gsub!(';', ";\n")
  end

  def squeeze_new_lines_into_one_line
    css_string.gsub!(/[\n]+/, "\n");
  end
end
