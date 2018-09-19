# When passed a css_vars hash and a css_data hash it will replace the "property values" in the css
# data hash with the variable names.
#
#   GIVEN:
#     css_data: { "p" => ["color: blue", "font-size: 15px"] }
#     css_vars: { "color-1" => "blue", "font-size-1" => "15px" }
#
#   OUTPUT: { "p" => ["color: $color-1", "font-size: $font-size-1"] }

class CssVariableReplacer
  def initialize(css_vars:, css_data:)
    @css_vars = css_vars.invert
    @css_data = css_data
    @new_data = {}
  end

  def replace
    css_data.each do |block_name, property_lines|
      new_data[block_name] = replace_property_lines_with_var(property_lines)
    end
    new_data
  end

  private

  attr_reader :css_vars, :css_data
  attr_accessor :new_data

  def replace_property_lines_with_var(property_lines)
    property_lines.map do |property_line|
      property_name, property_value = property_line.split(': ')
      if css_vars[property_value]
        "#{property_name}: $#{css_vars[property_value]}"
      else
        property_line
      end
    end
  end
end
