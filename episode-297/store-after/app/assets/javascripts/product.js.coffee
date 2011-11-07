class Product
  constructor: (@attributes) ->
  id: -> @attributes.id
  name: -> @attributes.name

  price: ->
    digits = String(Math.round(@attributes.price * 100)).split("").reverse()
    formatted = [digits.shift(), digits.shift(), "."]
    for digit, index in digits
      formatted.push(digit)
      if (index+1) % 3 == 0 && index+1 < digits.length
        formatted.push(",")
    "$" + formatted.reverse().join("")

  released_at: ->
    months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    date = new Date(@attributes.released_at)
    day = date.getDate()
    month = months[date.getMonth()]
    year = date.getFullYear()
    "#{month} #{day}, #{year}"

@Product = Product
