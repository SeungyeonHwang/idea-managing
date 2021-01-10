require 'rails_helper'

RSpec.describe Category, type: :model do
  it "is invalid without a name" do
    category = FactoryBot.build(:category, name: nil)
    category.valid?
    expect(category.errors[:name]).to include("can't be blank")
  end
end

RSpec.describe Category, :type => :model do
  describe 'email uniqueness' do
    before do
      FactoryBot.create(:category, name: 'test')
      @category = FactoryBot.build(:category, name: 'test')
    end

    it 'returns false with uniqueness validation' do
      expect(@category.save).to be_falsey
    end

    it 'raise 0 with a unique constraint' do
      expect do
        @category.save
      end.to change(Category, :count).by(+0)
    end
  end
end