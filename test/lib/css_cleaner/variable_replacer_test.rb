require './test/test_helper.rb'
require './lib/css_cleaner/variable_replacer.rb'

def css_data_for_variable_replacer
  { 'p' => ['color: blue', 'font-size: 15px'], '.green' => [ 'color: green' ] }
end

def css_variables_for_variable_replacer
  { 'color-1' => 'blue', 'color-2' => 'green', 'font-size-1' => '15px' }
end

describe 'VariableReplacer' do
  describe '#replace' do
    it 'will return a hash where the "property values" in the css data have been replaced with the matching variable names' do
      replacer = VariableReplacer.new(css_data: css_data_for_variable_replacer, css_vars: css_variables_for_variable_replacer)
      expected_results = { 'p' => ['color: $color-1', 'font-size: $font-size-1'], '.green' => ['color: $color-2'] }
      replacer.replace.must_equal expected_results
    end
  end
end
