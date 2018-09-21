require './test/test_helper.rb'
require './lib/css_cleaner/stringifier.rb'

def css_variables_for_stringifier
  { 'color-1' => 'blue', 'color-2' => 'green', 'font-size-1' => '15px' }
end

def css_data_for_stringifier
  { 'p' => ['color: $color-1', 'font-size: $font-size-1'], '.green' => ['color: $color-2'] }
end

describe 'Stringifier' do
  describe '#generate_string' do
    it 'will return the css data in the proper scss format' do
      stringifier = Stringifier.new(css_data: css_data_for_stringifier, css_vars: css_variables_for_stringifier)
      expected_results = "$color-1: blue;\n$color-2: green;\n$font-size-1: 15px;\n\np {\n  color: $color-1;\n  font-size: $font-size-1;\n}\n\n.green {\n  color: $color-2;\n}"
      stringifier.generate_string.must_equal expected_results
    end
  end
end
