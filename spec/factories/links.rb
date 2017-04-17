FactoryGirl.define do
  factory :link do
    title { Faker::GameOfThrones.character }
    url { Faker::Internet.url }
  end
end
