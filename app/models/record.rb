class Record < ApplicationRecord
  belongs_to :item
  belongs_to :user
  validates_presence_of :result, :date

  scope :order_by_date, -> { order(date: :desc) }

  def all_records(user)
    user.records.order_by_date.joins(:item).select('
      records.id,
      records.user_id,
      item_id,
      date,
      result,
      items.target AS target
      ')
  end

  def all_record_dates(user)
    user.records.order_by_date.map(&:date).uniq
  end
end
