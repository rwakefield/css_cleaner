require './test/test_helper.rb'
require './lib/css_cleaner/cleaner.rb'

def fixture_ugly_css_string
  <<~EOF
     p {
          color:    blue;
       font-size:   15px;
     }

     .green  { color: green;    }
  EOF
end

describe 'Cleaner' do
  describe '#clean' do
    it 'will reduce all whitespace to one space and output block format css' do
      cleaner = Cleaner.new(css_string: fixture_ugly_css_string)
      cleaner.clean.must_equal "p {\n  color: blue;\n  font-size: 15px;\n}\n\n.green {\n  color: green;\n}"
    end
  end
end
