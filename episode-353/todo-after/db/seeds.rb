ryanb = User.create! name: "ryanb", password: "secret"
ryanb.tasks.create! name: "record some RailsCasts"
ryanb.tasks.create! name: "work on CanCan"

daniel = User.create! name: "daniel", password: "secret"
daniel.tasks.create! name: "paint the fence"
daniel.tasks.create! name: "wax the car"
daniel.tasks.create! name: "sand the deck"
