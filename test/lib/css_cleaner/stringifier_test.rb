require './test/test_helper.rb'
require './lib/css_cleaner/stringifier.rb'

def css_variables_for_stringifier
  { 'color-1' => 'blue', 'color-2' => 'green', 'font-size-1' => '15px' }
end

def css_data_for_stringifier
  { 'p' => ['color: $color-1', 'font-size: $font-size-1'], '.green' => ['color: $color-2'] }
end

def css_data_for_stringifier_with_no_vars
  { '.green' => [ 'color: green' ], 'p' => ['color: blue', 'font-size: 15px', 'text-align: center'] }
end

describe 'Stringifier' do
  describe '#generate_string' do
    describe 'with vars' do
      it 'will return the css data in the proper scss format' do
        stringifier = Stringifier.new(css_data: css_data_for_stringifier, css_vars: css_variables_for_stringifier)
        expected_results = "$color-1: blue;\n$color-2: green;\n$font-size-1: 15px;\n\np {\n  color: $color-1;\n  font-size: $font-size-1;\n}\n\n.green {\n  color: $color-2;\n}"
        stringifier.generate_string.must_equal expected_results
      end
    end

    describe 'without vars' do
      it 'will return the css data in the proper scss format' do
        stringifier = Stringifier.new(css_data: css_data_for_stringifier_with_no_vars)
        expected_results = ".green {\n  color: green;\n}\n\np {\n  color: blue;\n  font-size: 15px;\n  text-align: center;\n}"
        stringifier.generate_string.must_equal expected_results
      end
    end
  end
end
