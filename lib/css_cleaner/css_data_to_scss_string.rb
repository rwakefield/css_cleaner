# Given the css data and the css vars output it to a formatted scss string

class CssDataToScssString
  def initialize(css_data:, css_vars:)
    @css_data = css_data
    @css_vars = css_vars
    @scss_string = ""
  end

  def generate_string
    add_vars_to_string
    scss_string << "\n"
    add_data_to_string
    scss_string.strip << "\n"
  end

  private

  def add_data_to_string
    block_name_string = ""
    property_lines_string = ""
    css_data.each do |block_name, property_lines|
      block_name_string = "#{block_name} {\n"
      property_lines_string = property_lines.map do |property_line|
        "  #{property_line};"
      end.join("\n")
      scss_string << ("#{block_name_string}#{property_lines_string}\n}\n\n")
    end
  end

  def add_vars_to_string
    css_vars.sort.to_h.each do |key, value|
      scss_string << "$#{key}: #{value};\n"
    end
  end

  attr_reader :css_data, :css_vars
  attr_accessor :scss_string
end
