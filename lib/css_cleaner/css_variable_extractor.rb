# Return a hasn of dynamically named css variables that match the "property_values"
# from the given css_data.
#
# GIVEN: { "p" => ["color: blue", "font-size: 15px"] }
# THEN: { "color-1" => "blue", "font-size-1" => "15px" }

class CssVariableExtractor

  def initialize(css_data:)
    @css_data = css_data
    @all_properties = []
    @property_counts = {}
    @css_variables = {}
  end

  def extract_variables
    get_all_properties_from_css_data
    all_properties.each do |property_line|
      map_property_line_to_variable_name(property_line)
    end
    css_variables.sort.to_h
  end

  private

  attr_reader :css_data
  attr_accessor :all_properties, :css_variables, :property_counts

  def get_all_properties_from_css_data
    block_properties = css_data.values
    block_properties.each do |properties|
      properties.each do |property|
        all_properties.push(property)
      end
    end
    all_properties.uniq!
  end

  def map_property_line_to_variable_name(property_line)
    property_name, property_value = property_line.split(': ')
    property_counts[property_name] = 1 unless property_counts[property_name]
    var_name = generate_variable_name(property_name)
    css_variables[var_name] = property_value
  end

  def generate_variable_name(property_name)
    count = property_counts[property_name]
    property_counts[property_name] += 1
    "#{property_name}-#{count}"
  end
end
