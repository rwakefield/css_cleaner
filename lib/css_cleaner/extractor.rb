# Used to convert a css_string into a readable hash format where the "block_name" is
# the hash key and the value is an array of property lines.

class Extractor
  def initialize(css_string:)
    @css_string = css_string
    @css_data_hash = {}
  end

  def extract
    css_string.each_line do |line|
      extract_data_from_line(line)
    end
    sort_data_properties
    css_data_hash.sort.to_h
  end

  private

  attr_reader :css_string
  attr_accessor :current_block_name, :current_block_properties, :css_data_hash

  def extract_data_from_line(line)
    if line_is_block_name?(line)
      add_block_name(line)
    elsif line_is_property_line?(line)
      add_property_line_to_current_block_name(line)
    end
  end

  def line_is_block_name?(line)
    line.include?('{')
  end

  def add_block_name(line)
    @current_block_name = line.gsub(' {', '').strip
    if css_data_hash[current_block_name]
      remap_current_block_properties
    else
      css_data_hash[current_block_name] = []
      @current_block_properties = []
    end
  end

  def remap_current_block_properties
    @current_block_properties = css_data_hash[current_block_name].map { |property_line| property_line.split(':')[0] }
  end

  def line_is_property_line?(line)
    line.include?(':')
  end

  def add_property_line_to_current_block_name(line)
    property_line = line.gsub(';', '').strip
    property_name = property_line.split(':')[0]
    check_if_property_name_in_block(property_name)
    css_data_hash[current_block_name].push(property_line)
  end

  def check_if_property_name_in_block(property_name)
    if current_block_properties.include?(property_name)
      remove_duplicated_property(property_name)
    else
      current_block_properties.push(property_name)
    end
  end

  def remove_duplicated_property(property_name)
    duplicate_position = current_block_properties.index(property_name)
    current_block_properties.delete_at(duplicate_position)
    current_block_properties.push(property_name)
    existing_properties = css_data_hash[current_block_name]
    existing_properties.delete_at(duplicate_position)
    css_data_hash[current_block_name] = existing_properties
  end

  def sort_data_properties
    css_data_hash.each { |block_name, _properties| css_data_hash[block_name].sort! }
  end
end
