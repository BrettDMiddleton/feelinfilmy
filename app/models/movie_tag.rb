class MovieTag < ApplicationRecord
  belongs_to :movie
  belongs_to :user
  belongs_to :tag
end
