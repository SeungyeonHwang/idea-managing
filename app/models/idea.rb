class Idea < ApplicationRecord
  belongs_to :category

  delegate :category, to: :category
end
