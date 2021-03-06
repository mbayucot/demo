FactoryBot.define do
  factory :import do
    uuid { Faker::Number.number(digits: 10) }
    klass { Faker::Lorem.word }
    user
    file { FilesTestHelper.csv }
  end
end
