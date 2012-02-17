// This file was automatically generated from simple.soy.
// Please don't edit this file by hand.

if (typeof examples == 'undefined') { var examples = {}; }
if (typeof examples.simple == 'undefined') { examples.simple = {}; }


examples.simple.helloWorld = function(opt_data, opt_sb) {
  var output = opt_sb || new soy.StringBuilder();
  output.append('Hello world!');
  return opt_sb ? '' : output.toString();
};


examples.simple.helloName = function(opt_data, opt_sb) {
  var output = opt_sb || new soy.StringBuilder();
  output.append((! opt_data.greetingWord) ? 'Hello ' + soy.$$escapeHtml(opt_data.name) + '!' : soy.$$escapeHtml(opt_data.greetingWord) + ' ' + soy.$$escapeHtml(opt_data.name) + '!');
  return opt_sb ? '' : output.toString();
};


examples.simple.helloNames = function(opt_data, opt_sb) {
  var output = opt_sb || new soy.StringBuilder();
  examples.simple.helloName(opt_data, output);
  output.append('<br>');
  var additionalNameList18 = opt_data.additionalNames;
  var additionalNameListLen18 = additionalNameList18.length;
  if (additionalNameListLen18 > 0) {
    for (var additionalNameIndex18 = 0; additionalNameIndex18 < additionalNameListLen18; additionalNameIndex18++) {
      var additionalNameData18 = additionalNameList18[additionalNameIndex18];
      examples.simple.helloName({name: additionalNameData18}, output);
      output.append((! (additionalNameIndex18 == additionalNameListLen18 - 1)) ? '<br>' : '');
    }
  } else {
    output.append('No additional people to greet.');
  }
  return opt_sb ? '' : output.toString();
};
