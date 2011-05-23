var CreditCard = {
  cleanNumber: function(number) {
    return number.replace(/[- ]/g, "");
  },
  
  validNumber: function(number) {
    var total = 0;
    number = this.cleanNumber(number);
    for (var i=number.length-1; i >= 0; i--) {
      var n = +number[i];
      if ((i+number.length) % 2 == 0) {
        n = n*2 > 9 ? n*2 - 9 : n*2;
      }
      total += n;
    };
    return total % 10 == 0;
  }
};

$(function() {
  $("#order_credit_card_number").blur(function() {
    if (CreditCard.validNumber(this.value)) {
      $("#credit_card_number_error").text("");
    } else {
      $("#credit_card_number_error").text("Invalid credit card number.");
    }
  });
});
