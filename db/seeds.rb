user = User.create!(email: "user@localhost", password: "12345678")
role = Role.create!(name: "User")

user.roles << role

word_counts = WordCount.create!([
  {
    date: Date.current,
    notes: nil,
    user: user
  },
  {
    date: Date.yesterday,
    notes: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    user: user
  },
  {
    date: 2.days.ago,
    notes: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    user: user
  }
])

work_files = WorkFile.create!([
  {name: "file1.doc"},
  {name: "file2.doc"},
  {name: "file3.doc"}
])

work_types = WorkType.create!([
  {name: "Translation", multiplicand: 1.0},
  {name: "Revision", multiplicand: 0.5},
  {name: "Check", multiplicand: 0.25}
])

WordCountFile.create!([
  {
    actual_word_count: 2000,
    notes: nil,
    word_count: word_counts.sample,
    work_file: work_files.sample,
    work_type: work_types.sample
  },
  {
    actual_word_count: 3350,
    notes: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    word_count: word_counts.sample,
    work_file: work_files.sample,
    work_type: work_types.sample
  },
  {
    actual_word_count: 1555,
    notes: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    word_count: word_counts.sample,
    work_file: work_files.sample,
    work_type: work_types.sample
  }
])
