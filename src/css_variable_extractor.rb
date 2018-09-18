class CssVariableExtractor
  def initialize(css_data:)
    @css_values = css_data.values
    @var_array = get_var_array
  end

  def extract_variables
    var_hash = {}
    var_array.each do |var|
      var_name = clean_var_name(var.join(''))
      var_value = var[1]
      var_hash[var_name] = var_value
    end
    var_hash
  end

  private

  def clean_var_name(var_name)
    var_name.gsub(/[^0-9a-z ]/i, '').gsub(' ','-')
  end

  def get_var_array
    var_array = []
    css_values.each do |values|
      values.each do |value|
        var_array.push(value.split(':').map(&:strip))
      end
    end
    var_array.uniq
  end

  attr_reader :css_values, :var_array
end
