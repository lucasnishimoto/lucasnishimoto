const Handlebars = require('handlebars');
const path = require('path');

// Define your template using Handlebars syntax
const source = `
  <ul>
    {{#each items}}
      <li>{{this}}</li>
    {{/each}}
  </ul>
`;

// Compile the template into a function
const template = Handlebars.compile(source);

// Define the data to be used in the template
const data = {
  items: ['apple', 'banana', 'orange']
};

// Render the template with the data
const rendered = template(data);

// Define the output file path
const outputFilePath = path.join(__dirname, 'output.log');

// Create a writable stream to the output file
const outputStream = require('stream').Writable();
outputStream._write = (chunk, encoding, done) => {
  console.log(`Wrote ${chunk.length} bytes to ${outputFilePath}`);
  done();
};

// Write the rendered output to the output stream
outputStream.write(rendered);

// End the output stream to complete the write operation
outputStream.end();
