require './test/test_helper.rb'
require './lib/css_cleaner/css_variable_extractor.rb'

describe 'CssVariableExtractor' do
  describe '#extract_variables' do
    it 'will return a hash of dynamically named css variables taken from the passed in css_data hash' do
      extractor = CssVariableExtractor.new(css_data: fixture_css_data_no_variables)
      extractor.extract_variables.must_equal fixture_css_vars
    end
  end
end
