require 'test_helper'
require './lib/css_cleaner.rb'

def expected_contents_with_vars
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

def expected_contents_without_vars
  <<~EOF
    .green {
      color: green;
    }

    p {
      color: blue;
      font-size: 15px;
      text-align: center;
    }
  EOF
end

describe 'CssCleaner' do
  before do
    Dir.glob('./output/*.scss').each { |file| File.delete(file) }
  end

  after do
    Dir.glob('./output/*.scss').each { |file| File.delete(file) }
    cleaner = CssCleaner.new(filename: 'data/sample.css')
    cleaner.clean
  end

  it 'will output scss file based off contents given in filename' do
    cleaner = CssCleaner.new(filename: 'data/sample.css')
    cleaner.clean

    expected_file = './output/sample.scss'
    File.exist?(expected_file).must_equal true
    file = File.open(expected_file)
    contents = file.read
    contents.must_equal expected_contents_with_vars
    file.close
  end

  it 'will output file with no vars when use_variables is false' do
    cleaner = CssCleaner.new(filename: 'data/sample.css', use_variables: false)
    cleaner.clean

    expected_file = './output/sample.scss'
    File.exist?(expected_file).must_equal true
    file = File.open(expected_file)
    contents = file.read
    contents.must_equal expected_contents_without_vars
    file.close
  end
end
