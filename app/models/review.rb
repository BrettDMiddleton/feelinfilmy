class Review < ApplicationRecord
  validates :text, presence: true
  belongs_to :user
  belongs_to :movie
end
