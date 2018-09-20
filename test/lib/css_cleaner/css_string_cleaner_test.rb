require './test/test_helper.rb'
require './lib/css_cleaner/css_string_cleaner.rb'

describe 'CssStringCleaner' do
  describe '#clean' do
    it 'will reduce all whitespace to one space and output block format css' do
      cleaner = CssStringCleaner.new(css_string: fixture_ugly_css_string)
      cleaner.clean.must_equal fixture_css_string
    end

    it 'will fix a one liner css' do
      cleaner = CssStringCleaner.new(css_string: fixture_one_liner_css)
      cleaner.clean.must_equal "p {\n  color: blue;\n}\n"
    end
  end
end
