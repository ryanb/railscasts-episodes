card = Category.create! name: "Card"
dice = Category.create! name: "Dice"
party = Category.create! name: "Party"
strategy = Category.create! name: "Strategy"

days_of_wonder = Publisher.create! name: "Days of Wonder"
mayfair = Publisher.create! name: "Mayfair Games"
rio = Publisher.create! name: "Rio Grande Games"
zman = Publisher.create! name: "Z-Man Games"

Product.create! name: "Settlers of Catan",
  price: 33.60,
  publisher: mayfair,
  categories: [strategy, card, dice],
  released_on: "1995-02-05",
  rating: 5

Product.create! name: "Agricola",
  price: 42.24,
  publisher: zman,
  categories: [strategy, card],
  released_on: "2007-05-18",
  rating: 5

Product.create! name: "Small World",
  price: 35.00,
  publisher: days_of_wonder,
  categories: [strategy, dice],
  released_on: "2009-04-12",
  rating: 4

Product.create! name: "Stone Age",
  price: 28.99,
  publisher: rio,
  categories: [strategy, dice],
  released_on: "2008-07-15",
  rating: 5

Product.create! name: "Puerto Rico",
  price: 27.00,
  publisher: rio,
  categories: [strategy],
  released_on: "2002-03-25",
  rating: 5

Product.create! name: "Bohnanza",
  price: 27.00,
  publisher: rio,
  categories: [card],
  released_on: "1997-06-10",
  rating: 5

Product.create! name: "Ticket to Ride",
  price: 37.50,
  publisher: days_of_wonder,
  categories: [strategy, card],
  released_on: "2009-04-12",
  rating: 4
