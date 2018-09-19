require './test/test_helper.rb'
require './lib/css_cleaner/css_data_to_scss_string.rb'

describe 'CssDataToScssString' do
  describe '#generate_string' do
    it 'will return the css data in the proper scss format' do
      stringifier = CssDataToScssString.new(css_data: fixture_css_data_with_variables, css_vars: fixture_css_vars)
      stringifier.generate_string.must_equal fixture_scss_string
    end
  end
end
