require './test/test_helper.rb'
require './lib/css_cleaner/extractor.rb'

def css_string_for_extractor
  <<~EOF
     p {
       color: blue;
       font-size: 15px;
     }

    .green {
      color: green;
    }
  EOF
end

describe 'Extractor' do
  describe '#extract' do
    it 'will output a hash with the block_name as the key and the property_lines as the values' do
      extractor = Extractor.new(css_string: css_string_for_extractor)
      expected_results = { 'p' => ['color: blue', 'font-size: 15px'], '.green' => [ 'color: green' ] }
      extractor.extract.must_equal expected_results
    end
  end
end
