# frozen_string_literal: true

admin = User.create!(email: "admin@example.com", password: "12345678")
Role.create!(name: "Admin", users: [admin])

work_file = WorkFile.create!(name: "file.doc")
work_type = WorkType.create!(name: "Translation", multiplicand: 1.0)

WordCount.create!(
  date: Date.current,
  actual_word_count: 1,
  notes: nil,
  work_type: work_type,
  user: admin,
  work_files: [work_file]
)
