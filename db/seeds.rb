# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create!(email: "user@localhost", password: "12345678")
role = Role.create!(name: "User")

user.roles << role

work_type = WorkType.create!(name: "Translation", multiplicand: 1.0)
work_file = WorkFile.create!(name: "file.doc")
word_count = WordCount.create!(date: Date.current, notes: nil, user: user)

WordCountFile.create!(
  actual_word_count: 1,
  notes: nil,
  work_type: work_type,
  work_files: [work_file],
  word_counts: [word_count]
)
