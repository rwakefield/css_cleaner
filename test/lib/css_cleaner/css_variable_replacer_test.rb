require './test/test_helper.rb'
require './lib/css_cleaner/css_variable_replacer.rb'

describe 'CssVariableReplacer' do
  describe '#replace' do
    it 'will return a hash where the "property values" in the css data have been replaced with the matching variable names' do
      replacer = CssVariableReplacer.new(css_data: fixture_css_data_no_variables, css_vars: fixture_css_vars)
      replacer.replace.must_equal fixture_css_data_with_variables
    end
  end
end
