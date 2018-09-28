# css_cleaner

This is very much still in the brainstorming phase but the initial idea for this is to take a css file, clean out whitespace, and output a formatted SCSS file that has the properties in alphabetical order and all of the property values in dynamically created css variables.

The idea for this is sometimes css files get out of hand and they become hard to search and maintain. This will clean them out and give you all properties as variables up top.

Eventually this will accept CSS, SASS, and SCSS files so, in theory, you can update the sample file and it should output itself.

### To Run

```bash
ruby -Ilib ./bin/css_cleaner
```

### Full Feature Example

**IN ->**
```css
p {
  font-size: 20px;
  color: orange;
  font-size: 30px;
  color: green;
  font-size: 15px;
}

.green { color: green; }

p {
  text-align: center;
  color: blue;
}
```

**OUT ->**
```css
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
```
