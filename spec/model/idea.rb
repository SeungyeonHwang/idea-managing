require 'rails_helper'

RSpec.describe Idea, type: :model do
  it "is invalid without a category_id" do
    idea = FactoryBot.build(:idea, category_id: nil)
    idea.valid?
    expect(idea.errors[:category_id])
  end

  it "is invalid without a body" do
    idea = FactoryBot.build(:idea, body: nil)
    idea.valid?
    expect(idea.errors[:body])
  end
end