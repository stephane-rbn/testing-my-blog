class Comment < ApplicationRecord
  belongs_to :article
  belongs_to :user

  validates :content,
            presence: true,
            length: { maximum: 250 }
end
