admin_user = User.create(email: "admin@ticketee.com", password: "password")
admin_user.admin = true
admin_user.confirm!
Project.create(name: "Ticketee Beta")

new_user = User.create(email: "new_user@ticketee.com", password: "password")
new_user.confirm!

State.create(name: "New", background: "#85FF00", color: "white", default: true)
