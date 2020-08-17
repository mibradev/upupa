# frozen_string_literal: true

admin = User.create!(email: "admin@example.com", password: "12345678")
Role.create!(name: "Admin", users: [admin])
WordCount.create!(date: Date.current, actual_word_count: 1, notes: nil, user: admin)
FileInfo.create!(name: "file.doc")
