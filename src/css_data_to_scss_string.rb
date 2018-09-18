class CssDataToScssString
  def initialize(css_data:, css_vars:)
    @css_data = css_data
    @css_vars = css_vars
    @scss_string = ""
  end

  def generate_string
    add_vars_to_string
    scss_string << "\n\n"
    add_data_to_string
    scss_string
  end

  private

  def add_data_to_string
    key_string = ""
    value_string = ""
    css_data.each do |key, values|
      key_string = "#{key} {\n"
      value_string = values.map do |value|
        "  #{value};"
      end.join("\n")
      scss_string << ("#{key_string}#{value_string}\n}\n\n")
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
