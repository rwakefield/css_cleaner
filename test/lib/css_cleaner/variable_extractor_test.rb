require './test/test_helper.rb'
require './lib/css_cleaner/variable_extractor.rb'

def css_data_for_variable_extractor
  { 'p' => ['color: blue', 'font-size: 15px'], '.green' => [ 'color: green' ] }
end

describe 'VariableExtractor' do
  describe '#extract_variables' do
    it 'will return a hash of dynamically named css variables taken from the passed in css_data hash' do
      extractor = VariableExtractor.new(css_data: css_data_for_variable_extractor)
      expected_results = {'color-1' => 'blue', 'color-2' => 'green', 'font-size-1' => '15px'}
      extractor.extract_variables.must_equal expected_results
    end
  end
end
