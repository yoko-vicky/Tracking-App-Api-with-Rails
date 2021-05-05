require 'rails_helper'

RSpec.describe Record, type: :model do
  describe 'Testing validations' do
    it { should validate_presence_of(:result) }
    it { should validate_presence_of(:date) }
  end

  describe 'Testing associations' do
    it { should belong_to(:item) }
    it { should belong_to(:user) }
  end

  describe 'Testing scopes' do
    let!(:user) { User.create(id: 1, username: 'yocotan', password: 'yocotan') }
    let!(:item1) { Item.create(id: 1, title: 'Abc', unit: 'abc', icon: 'abc:abcicon', target: 30) }
    let!(:item2) { Item.create(id: 3, title: 'Xyz', unit: 'xyz', icon: 'xyz:xyzicon', target: 45) }
    let!(:record1) { Record.create(user_id: 1, date: '1615680000000', result: 32, item_id: 1) }
    let!(:record2) { Record.create(user_id: 1, date: '1815240000000', result: 116, item_id: 3) }

    describe '.order_by_date' do
      it 'returns records collection ordered by date' do
        expect(Record.order_by_date.first).to eq record2
      end

      it 'returns empty records collection array if there is no record object' do
        Record.destroy_all
        expect(Record.order_by_date).to eq []
      end
    end
  end
end
