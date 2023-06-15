void main() {
  // forinteger
  var x = 1;
  print(x);

  // forhexa
  var hex = 0xDEADBEEF;
  print(hex);

  // fordouble
  var y = 1.1;
  print(y);

  //forexponent
  var exponents = 1.42e5;
  print(exponents);

  num n = 1; // x can have both int and double values
  n += 2.5;
  print(n);

  //fordouble
  double z = 1; // Equivalent to double z = 1.0.
  print(z);

  // String -> int
  var one = int.parse('1');
  assert(one == 1);

// String -> double
  var onePointOne = double.parse('1.1');
  assert(onePointOne == 1.1);

// int -> String
  String oneAsString = 1.toString();
  assert(oneAsString == '1');

// double -> String
  String piAsString = 3.14159.toStringAsFixed(2);
  assert(piAsString == '3.14');

//forconst
  const msPerSecond = 1000;
  const secondsUntilRetry = 5;
  const msUntilRetry = secondsUntilRetry * msPerSecond;
  print(msUntilRetry);

//forstring
  var s1 = 'Single quotes work well for string literals.'; //shouldbeuse
  var s2 = "Double quotes work just as well.";
  print(s1 + '\n' + s2);

  var s = 'string interpolation';
  assert('Dart has $s, which is very handy.' ==
      'Dart has string interpolation, '
          'which is very handy.');
  assert('That deserves all caps. '
          '${s.toUpperCase()} is very handy!' ==
      'That deserves all caps. '
          'STRING INTERPOLATION is very handy!');

  //formultisring
  //to create a multi-line string:
  // use a triple quote with either
  // single or double quotation marks
  var s3 = 'String '
      'concatenation'
      " works even over line breaks.";
  assert(s3 ==
      'String concatenation works even over '
          'line breaks.');

  var s4 = 'The + operator ' + 'works, as well.';
  assert(s4 == 'The + operator works, as well.');

  var s5 = '''
  You can create 
  multi-line strings like this one.
          ''';

  var s6 = """This is also 
a multi-line string.""";
  print(s3);
  print(s4);
  print(s5);
  print(s6);

  // These work in a const string.
  const aConstNum = 0;
  const aConstBool = true;
  const aConstString = 'a constant string';
  const validConstString = '$aConstNum $aConstBool $aConstString';
  print(validConstString);
// These do NOT work in a const string.
  // var aNum = 0;
  // var aBool = true;
  // var aString = 'a string';
  // const aConstList = [1, 2, 3];
  // const invalidConstString = '$aNum $aBool $aString $aConstList';

  // Check for an empty string.
  var fullName = '';
  assert(fullName.isEmpty);

// Check for zero.
  var hitPoints = 0;
  assert(hitPoints <= 0);

// Check for null.
  var unicorn = null;
  assert(unicorn == null);

// Check for NaN.
  var iMeantToDoThis = 0 / 0;
  assert(iMeantToDoThis.isNaN);

  var hi = 'Hi 🇩🇰';
  print(hi);
  print('The end of the string: ${hi.substring(hi.length - 1)}');
  // print('The last character: ${hi.characters.last}');
}
