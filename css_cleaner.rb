require './src/css_extractor.rb'
require './src/css_variable_extractor.rb'
require './src/css_variable_replacer.rb'
require './src/css_data_to_scss_string.rb'

class CssCleaner
  def initialize(filename:)
    @css_string = File.read(filename)
  end

  def clean
    extract_data
    extract_vars
    replace_vars_in_data
    convert_data_and_vars_to_string
    puts "CSS DATA: #{css_data}\n\n"
    puts "CSS VARS: #{css_vars}"
    puts "OUTPUT:\n\n\n#{scss_string}"
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

  attr_reader :css_data, :css_string, :css_vars, :scss_string
end

cleaner = CssCleaner.new(filename: './data/sample.css')
cleaner.clean
