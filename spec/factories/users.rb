FactoryGirl.define do
  factory :user do
    name { Faker::LeagueOfLegends.champion }
    password "password"
    password_confirmation 'password'
    email 'coolguy@email'
  end
end
