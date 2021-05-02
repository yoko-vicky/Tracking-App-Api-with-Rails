class Record < ApplicationRecord
  belongs_to :item
  belongs_to :user
  validates_presence_of :result, :date

  scope :order_by_date, -> { order(date: :desc) }

  def self.all_records(user)
    user.records.order_by_date.joins(:item).select('
      records.id,
      records.user_id,
      item_id,
      date,
      result,
      items.target AS target
      ')
  end

  def self.all_record_dates(user)
    user.records.order_by_date.pluck(:date).uniq
  end
end
