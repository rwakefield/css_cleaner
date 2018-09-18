class CssExtractor
  attr_accessor :css_hash

  def initialize(css_string:)
    @css_string = css_string
    @css_hash = {}
    @current_key = nil
  end

  def extract_to_hash
    css_string.each_line do |line|
      line = remove_whitespace_from(line)
      extract_data_from_line(line)
    end
    css_hash
  end

  private

  def add_value_to_current_key(line)
    value = line.gsub(';', '').strip
    @css_hash[@current_key].push(value)
  end

  def add_key(line)
    key = line.gsub(' {', '').strip
    css_hash[key] = [] unless css_hash[key]
    key
  end

  def extract_data_from_line(line)
    if line_is_key?(line)
      key = add_key(line)
      @current_key = key
    else
      add_value_to_current_key(line) if line_is_value?(line)
    end
  end

  def line_is_key?(line)
    line.include?('{')
  end

  def line_is_value?(line)
    line.include?(':')
  end

  def remove_whitespace_from(line)
    line.gsub(/\s+/, ' ')
  end

  attr_reader :css_string
end
