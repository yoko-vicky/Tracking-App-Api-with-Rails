class Record < ApplicationRecord
  belongs_to :item
  belongs_to :user
  validates_presence_of :result, :date

  scope :order_by_updated, -> { order(updated_at: :desc) }
end
