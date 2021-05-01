user = User.create!(email: "user@localhost", password: "12345678")
role = Role.create!(name: "User")

user.roles << role

work_file = WorkFile.create!(name: "file.doc")
work_type = WorkType.create!(name: "Translation", multiplicand: 1.0)
word_count = WordCount.create!(date: Date.current, notes: nil, user: user)

WordCountFile.create!(
  actual_word_count: 1,
  notes: nil,
  work_file: work_file,
  work_type: work_type,
  word_counts: [word_count]
)
