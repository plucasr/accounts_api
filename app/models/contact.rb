class Contact < ApplicationRecord
  belongs_to :user

  validates :slug, presence: true
  validates :value, presence: true
end
