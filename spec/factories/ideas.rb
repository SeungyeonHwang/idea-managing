require 'faker'

FactoryBot.define do
  factory :idea do
    body { Faker::Book.publisher }
  end
end
