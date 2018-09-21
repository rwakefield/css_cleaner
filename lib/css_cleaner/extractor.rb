# Used to convert a css_string into a readable hash format where the "block_name" is
# the hash key and the value is an array of property lines.

class Extractor
  def initialize(css_string:)
    @css_string = css_string
    @css_data_hash = {}
    @current_block_name = nil
  end

  def extract
    css_string.each_line do |line|
      extract_data_from_line(line)
    end
    css_data_hash
  end

  private

  attr_reader :css_string
  attr_accessor :css_data_hash

  def extract_data_from_line(line)
    if line_is_block_name?(line)
      block_name = add_block_name(line)
      @current_block_name = block_name
    else
      add_property_line_to_current_block_name(line) if line_is_property_line?(line)
    end
  end

  def line_is_block_name?(line)
    line.include?('{')
  end

  def add_block_name(line)
    block_name = line.gsub(' {', '').strip
    css_data_hash[block_name] = [] unless css_data_hash[block_name]
    block_name
  end

  def add_property_line_to_current_block_name(line)
    property_line = line.gsub(';', '').strip
    @css_data_hash[@current_block_name].push(property_line)
  end

  def line_is_property_line?(line)
    line.include?(':')
  end
end
