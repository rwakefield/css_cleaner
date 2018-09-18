class CssVariableReplacer
  def initialize(css_vars:, css_data:)
    @css_vars = css_vars
    @css_data = css_data
    @new_data = {}
  end

  def replace
    css_data.each do |key, values|
      new_data[key] = replace_values_with_var(values)
    end
    new_data
  end

  private

  def replace_values_with_var(values)
    values.map do |value|
      var_name = get_var_name_from_value(value)
      if css_vars[var_name]
        "#{value.split(':')[0]}: $#{var_name}"
      else
        value
      end
    end
  end

  def get_var_name_from_value(value)
    values = value.split(':').map(&:strip)
    values.join('').gsub(/[^0-9a-z ]/i, '').gsub(' ','-')
  end

  attr_reader :css_vars, :css_data
  attr_accessor :new_data
end
