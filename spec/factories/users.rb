FactoryGirl.define do
  factory :user do
    name { Faker::GameOfThrones.character }
    password "password"
    password_confirmation 'password'
    email 'coolguy@email'
  end
end
