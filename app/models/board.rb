class Board < ApplicationRecord
  belongs_to :owner, foreign_key: :owner_id, class_name: 'User'

  validates :name, presence: true
  validates :name, length: { minimum: 1, maximum: 32 }
end
