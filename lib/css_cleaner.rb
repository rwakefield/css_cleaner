require_relative 'css_cleaner/cleaner.rb'
require_relative 'css_cleaner/extractor.rb'
require_relative 'css_cleaner/variable_extractor.rb'
require_relative 'css_cleaner/variable_replacer.rb'
require_relative 'css_cleaner/stringifier.rb'

class CssCleaner
  def initialize(filename:)
    @filename = filename;
    @css_string = File.read(filename)
  end

  def clean
    clean_css
    extract_data
    extract_vars
    replace_vars_in_data
    convert_data_and_vars_to_string
    output_cleaned_file
  end

  private

  def clean_css
    @css_string = Cleaner.new(css_string: css_string).clean
  end

  def extract_data
    @css_data = Extractor.new(css_string: css_string).extract
  end

  def extract_vars
    @css_vars = VariableExtractor.new(css_data: css_data).extract_variables
  end

  def replace_vars_in_data
    @css_data = VariableReplacer.new(css_vars: css_vars, css_data: css_data).replace
  end

  def convert_data_and_vars_to_string
    @scss_string = Stringifier.new(css_vars: css_vars, css_data: css_data).generate_string
  end

  def output_cleaned_file
    new_filename = filename.gsub('css', 'scss').gsub('data', 'output')
    out_file = File.new(new_filename, 'w')
    out_file.puts(scss_string)
    out_file.close
  end

  attr_reader :css_data, :css_string, :css_vars, :scss_string, :normalized_css_vars, :filename
end
