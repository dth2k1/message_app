class Message < ApplicationRecord
  belongs_to :user

  scope :custom, -> { order(:created_at).last(5) }
end
