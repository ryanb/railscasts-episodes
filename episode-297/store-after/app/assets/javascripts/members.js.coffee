jQuery ->
  $("#member_membership_number").blur ->
    if isValidMembershipNumber(@value)
      $("#membership_number_error").text("")
    else
      $("#membership_number_error").text("Invalid membership number")
