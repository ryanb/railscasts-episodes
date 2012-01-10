ryan = User.create!(name: "ryan", password: "secret")
admin = User.create!(name: "admin", password: "secret", admin: true)

ryan.tasks.create! name: "paint the fence"
ryan.tasks.create! name: "wax the car"
ryan.tasks.create! name: "sand the deck"

admin.tasks.create! name: "try turning it off"
admin.tasks.create! name: "and on again"
