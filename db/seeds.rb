roles = {
  admin: Role.create!(name: "Admin", system_role: true),
  translator: Role.create!(name: "Translator", system_role: true)
}

10.times do
  Role.create!(name: Faker::Job.unique.position)
end

users = {
  admin: User.create!(email: "admin@localhost", password: "12345678", roles: roles.values),
  translator: User.create!(email: "translator@localhost", password: "12345678", roles: [roles[:translator]])
}

["Index", "Show", "New", "Edit", "Create", "Update", "Destroy"].each do |name|
  Permission.create!(name:)
end

10.times do
  WorkFile.create!(name: "#{Faker::Food.unique.dish}.doc")
end

WorkType.create!(name: "Translation", multiplicand: 1.0)
WorkType.create!(name: "Revision", multiplicand: 0.5)
WorkType.create!(name: "Check", multiplicand: 0.25)

work_file_ids = WorkFile.ids
work_type_ids = WorkType.ids

10.times do
  word_count = WordCount.create!(
    date: Faker::Date.unique.backward,
    notes: Faker::Lorem.paragraph(sentence_count: 0, random_sentences_to_add: 3),
    user: users[:admin]
  )

  rand(0..3).times do
    WordCountFile.create!(
      actual_word_count: Faker::Number.within(range: 300..3000),
      notes: Faker::Lorem.paragraph(sentence_count: 0, random_sentences_to_add: 3),
      word_count:,
      work_file_id: work_file_ids.sample,
      work_type_id: work_type_ids.sample
    )
  rescue => error
    error.message == "Validation failed: Work file has already been taken" ? retry : raise
  end
end
