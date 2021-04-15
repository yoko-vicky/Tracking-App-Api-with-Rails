class Item < ApplicationRecord
  has_many :records, dependent: :destroy
  has_many :users, through: :records
  validates_presence_of :title, :unit

  scope :order_by_updated, -> { order(updated_at: :desc) }
  scope :order_by_title, -> { order(title: :asc) }
end
