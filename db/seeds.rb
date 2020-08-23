# frozen_string_literal: true

admin = User.create!(email: "admin@example.com", password: "12345678")
Role.create!(name: "Admin", users: [admin])

word_count_file = WordCountFile.create!(name: "file.doc")
WordCount.create!(date: Date.current, actual_word_count: 1, notes: nil, user: admin, word_count_files: [word_count_file])
