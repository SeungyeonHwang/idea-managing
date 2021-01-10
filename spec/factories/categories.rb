require 'faker'

FactoryBot.define do
  factory :category do
    name { Faker::Book.title }
    idea
  end
end
