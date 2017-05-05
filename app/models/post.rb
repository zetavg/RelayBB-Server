class Post < ApplicationRecord
  belongs_to :author, foreign_key: :author_id, class_name: 'User'
  belongs_to :board

  validates :subject, :text, presence: true
  validates :subject, length: { maximum: 32 }
end
