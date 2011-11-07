// Validates using the mod 10 algorithm
// Example valid number: 49927398716
function isValidMembershipNumber(number) {
  var total = 0;
  for (var i=number.length-1; i >= 0; i--) {
    var n = +number[i];
    if ((i+number.length) % 2 == 0) {
      n = n*2 > 9 ? n*2 - 9 : n*2;
    }
    total += n;
  };
  return total % 10 == 0;
}
