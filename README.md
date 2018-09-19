# css_cleaner
Convert CSS to SCSS

This is very much still in the brainstorming phase but the initial idea for this is to take a css file, clean out whitespace, and output a formatted SCSS file that has the properties in alphabetical order and all of the property values in dynamically created css variables.

The idea for this is sometimes css files get out of hand and they become hard to search and maintain. This will clean them out and give you all properties as variables up top.

Eventually this will accept CSS, SASS, and SCSS files so, in theory, you can update the sample file and it should output itself.

TODO:

- [ ] Write tests
- [ ] Refactor
- [ ] Make things configurable
- [ ] Fix common css errors like overwriting properties in the same
  block and combining duplicated blocks.
- [ ] Convert SASS to SCSS
- [ ] Clean up existing SCSS files

### Full Feature Example
```css
html {
  min-height: 100%;
  position: relative;
}

body {
  margin-bottom: 60px;
}

form {
  margin-bottom: 15px;
}

form .btn {
  margin-right: 15px;
}

h2 {
  margin-bottom: 15px;
}

#flash-messages .alert {
  margin-top: 15px;
}

#view-content {
  margin-top: 15px;
}

.actions {
  text-align: center;
  width: 150px;
}

.btn a {
  color: #fff;
  text-decoration: none;
}

.card {
  margin-bottom: 25px;
}

.id-col {
  width: 50px;
}

.message-header {
  display: inline-block;
  font-weight: bold;
  height: 30px;
  margin-right: 5px;
  vertical-align: middle;
}

.message-body {
  display: inline-block;
  height: 30px;
  margin-right: 5px;
  max-width: 700px;
  overflow: hidden;
  text-overflow: ellipsis;
  vertical-align: middle;
  white-space: nowrap;
}

.card .message-link {
  display: inline-block;
  height: 30px;
  vertical-align: middle;
}

.footer {
  background-color: #f5f5f5;
  bottom: 0;
  height: 60px;
  padding-top: 15px;
  position: absolute;
  text-align: center;
  width: 100%;
}

.form-signin {
  width: 100%;
  max-width: 330px;
  padding: 15px;
  margin: auto;
}

.form-signin .checkbox input {
  margin-right: 5px;
}

.form-signin .invalid-feedback {
  text-align: left;
}

.form-text {
  margin-bottom: 15px;
}

.pagination a, .pagination em, .pagination span {
  padding: 5px;
}

.smaller-column {
  width: 250px;
}

.sidebar {
  padding: 0;
  padding-top: 15px;
}

.sidebar ul {
  text-decoration: none;
  margin: 0;
}

.sidebar .nav-link {
  font-size: 15px;
  width: 100%;
  padding: 0;
  padding-bottom: 5px;
}

.sticky-top input, .sticky-top label {
  margin-right: 5px;
}

.sticky-top a {
  margin-left: 10px;
  color: #fff;
}

.sticky-top label {
  color: #fff;
}
```


```scss
$background-color-1: background-color: #f5f5f5;
$bottom-1: bottom: 0;
$color-1: color: #fff;
$display-1: display: inline-block;
$font-size-1: font-size: 15px;
$font-weight-1: font-weight: bold;
$height-1: height: 30px;
$height-2: height: 60px;
$margin-1: margin: auto;
$margin-2: margin: 0;
$margin-bottom-1: margin-bottom: 60px;
$margin-bottom-2: margin-bottom: 15px;
$margin-bottom-3: margin-bottom: 25px;
$margin-left-1: margin-left: 10px;
$margin-right-1: margin-right: 15px;
$margin-right-2: margin-right: 5px;
$margin-top-1: margin-top: 15px;
$max-width-1: max-width: 700px;
$max-width-2: max-width: 330px;
$min-height-1: min-height: 100%;
$overflow-1: overflow: hidden;
$padding-1: padding: 15px;
$padding-2: padding: 5px;
$padding-3: padding: 0;
$padding-bottom-1: padding-bottom: 5px;
$padding-top-1: padding-top: 15px;
$position-1: position: relative;
$position-2: position: absolute;
$text-align-1: text-align: center;
$text-align-2: text-align: left;
$text-decoration-1: text-decoration: none;
$text-overflow-1: text-overflow: ellipsis;
$vertical-align-1: vertical-align: middle;
$white-space-1: white-space: nowrap;
$width-1: width: 150px;
$width-2: width: 50px;
$width-3: width: 100%;
$width-4: width: 250px;

html {
  min-height: $min-height-1;
  position: $position-1;
}

body {
  margin-bottom: $margin-bottom-1;
}

form {
  margin-bottom: $margin-bottom-2;
}

form .btn {
  margin-right: $margin-right-1;
}

h2 {
  margin-bottom: $margin-bottom-2;
}

#flash-messages .alert {
  margin-top: $margin-top-1;
}

#view-content {
  margin-top: $margin-top-1;
}

.actions {
  text-align: $text-align-1;
  width: $width-1;
}

.btn a {
  color: $color-1;
  text-decoration: $text-decoration-1;
}

.card {
  margin-bottom: $margin-bottom-3;
}

.id-col {
  width: $width-2;
}

.message-header {
  display: $display-1;
  font-weight: $font-weight-1;
  height: $height-1;
  margin-right: $margin-right-2;
  vertical-align: $vertical-align-1;
}

.message-body {
  display: $display-1;
  height: $height-1;
  margin-right: $margin-right-2;
  max-width: $max-width-1;
  overflow: $overflow-1;
  text-overflow: $text-overflow-1;
  vertical-align: $vertical-align-1;
  white-space: $white-space-1;
}

.card .message-link {
  display: $display-1;
  height: $height-1;
  vertical-align: $vertical-align-1;
}

.footer {
  background-color: $background-color-1;
  bottom: $bottom-1;
  height: $height-2;
  padding-top: $padding-top-1;
  position: $position-2;
  text-align: $text-align-1;
  width: $width-3;
}

.form-signin {
  width: $width-3;
  max-width: $max-width-2;
  padding: $padding-1;
  margin: $margin-1;
}

.form-signin .checkbox input {
  margin-right: $margin-right-2;
}

.form-signin .invalid-feedback {
  text-align: $text-align-2;
}

.form-text {
  margin-bottom: $margin-bottom-2;
}

.pagination a, .pagination em, .pagination span {
  padding: $padding-2;
}

.smaller-column {
  width: $width-4;
}

.sidebar {
  padding: $padding-3;
  padding-top: $padding-top-1;
}

.sidebar ul {
  text-decoration: $text-decoration-1;
  margin: $margin-2;
}

.sidebar .nav-link {
  font-size: $font-size-1;
  width: $width-3;
  padding: $padding-3;
  padding-bottom: $padding-bottom-1;
}

.sticky-top input, .sticky-top label {
  margin-right: $margin-right-2;
}

.sticky-top a {
  margin-left: $margin-left-1;
  color: $color-1;
}

.sticky-top label {
  color: $color-1;
}
```
