# css_cleaner

This is very much still in the brainstorming phase but the initial idea for this is to take a css file, clean out whitespace, and output a formatted SCSS file that has the properties in alphabetical order and all of the property values in dynamically created css variables.

The idea for this is sometimes css files get out of hand and they become hard to search and maintain. This will clean them out and give you all properties as variables up top.

Eventually this will accept CSS, SASS, and SCSS files so, in theory, you can update the sample file and it should output itself.

TODO:

- [ ] Write tests
- [ ] Refactor
- [ ] Make things configurable
- [ ] Fix common css errors (like overwriting properties in the same block and combining duplicated blocks.)
- [ ] Convert SASS to SCSS
- [ ] Clean up existing SCSS files

### Full Feature Example

**IN ->**
```css     
p {
  color: blue;
  font-size: 15px;
}
```

**OUT ->**
```css
$color-1: blue;
$font-size-1: 15px;

p {
  color: $color-1;
  font-size: $font-size-1;
}
```
