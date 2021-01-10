class Category < ApplicationRecord
  has_many :ideas, dependent: :destroy

  alias_attribute :category_name, :name

  validates :name, presence:true, uniqueness: {case_sensitive: false}
end
