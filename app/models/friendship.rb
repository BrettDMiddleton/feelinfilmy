class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend_user, class_name: 'User'
end
