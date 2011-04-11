var CreditCard = {
  cleanNumber: function(number) {
    return number.replace(/[- ]/g, "");
  },
  
  validNumber: function(number) {
    var total = 0;
    number = this.cleanNumber(number);
    for (var i=number.length-1; i >= 0; i--) {
      var n = parseInt(number[i]);
      if ((i+number.length) % 2 == 0) {
        n = n*2 > 9 ? n*2 - 9 : n*2;
      }
      total += n;
    };
    return total % 10 == 0;
  }
};

(function($){
  $.fn.validateCreditCardNumber = function() {
    return this.each(function() {
      $(this).blur(function() {
        if (!CreditCard.validNumber(this.value)) {
          $("#" + this.id + "_error").text("Invalid credit card number.");
        } else {
          $("#" + this.id + "_error").text("");
        }
      });
    });
  };
})(jQuery);
