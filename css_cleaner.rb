require './src/css_extractor.rb'
require './src/css_variable_extractor.rb'
require './src/css_variable_replacer.rb'
require './src/css_data_to_scss_string.rb'

class CssCleaner
  def initialize(filename:)
    @filename = filename;
    @css_string = File.read(filename)
  end

  def clean
    extract_data
    extract_vars
    replace_vars_in_data
    convert_data_and_vars_to_string
    output_cleaned_file
  end

  private

  def extract_data
    @css_data = CssExtractor.new(css_string: css_string).extract_to_hash
  end

  def extract_vars
    @css_vars = CssVariableExtractor.new(css_data: css_data).extract_variables
  end

  def replace_vars_in_data
    @css_data = CssVariableReplacer.new(css_vars: css_vars, css_data: css_data).replace
  end

  def convert_data_and_vars_to_string
    @scss_string = CssDataToScssString.new(css_vars: css_vars, css_data: css_data).generate_string
  end

  def output_cleaned_file
    new_filename = filename.gsub('css', 'scss').gsub('data', 'output')
    out_file = File.new(new_filename, "w")
    out_file.puts(scss_string)
    out_file.close
    puts "SUCCESS: #{new_filename} created"
  end

  attr_reader :css_data, :css_string, :css_vars, :scss_string, :normalized_css_vars, :filename
end

cleaner = CssCleaner.new(filename: './data/sample.css')
cleaner.clean
