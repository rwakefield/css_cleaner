require 'test_helper'
require './lib/css_cleaner.rb'

def expected_contents
  <<~EOF
    $color-1: green;
    $color-2: blue;
    $font-size-1: 15px;
    $text-align-1: center;

    .green {
      color: $color-1;
    }

    p {
      color: $color-2;
      font-size: $font-size-1;
      text-align: $text-align-1;
    }
  EOF
end

describe 'CssCleaner' do
  before do
    Dir.glob('./output/*.scss').each { |file| File.delete(file) }
  end

  it 'will output scss file based off contents given in filename' do
    cleaner = CssCleaner.new(filename: 'data/sample.css')
    cleaner.clean

    expected_file = './output/sample.scss'
    File.exist?(expected_file).must_equal true
    file = File.open(expected_file)
    contents = file.read
    contents.must_equal expected_contents
    file.close
  end
end
