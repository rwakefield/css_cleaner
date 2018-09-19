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

  def replace_property_lines_with_var(property_lines)
    property_lines.map do |property_line|
      if css_vars[property_line]
        property_name = property_line.split(' ')[0]
        "#{property_name} $#{css_vars[property_line]}"
      else
        property_line
      end
    end
  end

  attr_reader :css_vars, :css_data
  attr_accessor :new_data
end
