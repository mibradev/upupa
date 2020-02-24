# frozen_string_literal: true

admin = User.create!(email: "admin@example.com", password: "12345678")
Role.create!(name: "Admin", users: [admin])
