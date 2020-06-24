class Article < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  validates :is_draft, inclusion: { in: [true, false] }
end
