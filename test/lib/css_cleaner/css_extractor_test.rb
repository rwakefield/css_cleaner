require './test/test_helper.rb'
require './lib/css_cleaner/css_extractor.rb'

describe 'CssExtractor' do
  describe '#extract' do
    it 'will output a hash with the block_name as the key and the property_lines as the values' do
      extractor = CssExtractor.new(css_string: fixture_css_string)
      extractor.extract.must_equal fixture_css_data_no_variables
    end
  end
end
