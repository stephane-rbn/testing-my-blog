class Article < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :content, presence: true
  validates :is_draft, inclusion: { in: [true, false] }

  after_initialize do
    self.is_draft = false if new_record?
  end
end
