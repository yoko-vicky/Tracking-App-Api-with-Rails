class Record < ApplicationRecord
  belongs_to :item
  belongs_to :user
  validates_presence_of :result, :date
end
