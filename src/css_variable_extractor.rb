
class CssVariableExtractor

  def initialize(css_data:)
    @css_data = css_data
    @all_properties = []
    @property_counts = {}
    @css_variables = {}
  end

  def extract_variables
    get_all_properties_from_css_data
    zero_out_property_counts
    map_property_lines_to_variable_names
    css_variables.sort.to_h
  end

  private

  def get_all_properties_from_css_data
    block_properties = css_data.values
    block_properties.each do |properties|
      properties.each do |property|
        all_properties.push(property)
      end
    end
    all_properties.uniq!
  end

  def generate_variable_name(property_line)
    property_name = get_property_name(property_line)
    count = property_counts[property_name]
    if count
      count += 1
      property_counts[property_name] = count
    else
      property_counts[property_name] = 1
    end
    "#{property_name}-#{count}"
  end

  def map_property_lines_to_variable_names
    all_properties.each do |property_line|
      var_name = generate_variable_name(property_line)
      css_variables[var_name] = property_line
    end
  end

  def get_property_name(property_line)
    property_line.split(': ')[0]
  end

  def zero_out_property_counts
    all_properties.each do |property_line|
      property_name = get_property_name(property_line)
      property_counts[property_name] = 0
    end
  end

  attr_reader :css_data
  attr_accessor :all_properties, :css_variables, :property_counts
end
