require 'minitest/autorun'

def fixture_input_css
  <<~EOF
     p {
       color: blue;
       font-size: 15px;
     }
  EOF
end

def fixture_css_data_no_variables
  { 'p' => ['color: blue', 'font-size: 15px'] }
end

def fixture_css_vars
  { 'color-1' => 'blue', 'font-size-1' => '15px' }
end

def fixture_css_data_with_variables
  { 'p' => ['color: $color-1', 'font-size: $font-size-1'] }
end

def fixture_scss_string
  <<~EOF
    $color-1: blue;
    $font-size-1: 15px;

    p {
      color: $color-1;
      font-size: $font-size-1;
    }
  EOF
end

