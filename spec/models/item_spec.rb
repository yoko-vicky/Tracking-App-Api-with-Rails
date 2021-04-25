require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'Testing validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:unit) }
    it { should validate_presence_of(:target) }
  end

  describe 'Testing associations' do
    it { should have_many(:records).dependent(:destroy) }
    it { should have_many(:users).through(:records) }
  end

  describe 'Testing scopes' do
    let!(:item1) { Item.create(title: 'Abc', unit: 'abc', icon: 'abc:abcicon', target: 30) }
    let!(:item2) { Item.create(title: 'Xyz', unit: 'xyz', icon: 'xyz:xyzicon', target: 45) }

    describe '.order_by_title' do
      it 'returns items collection ordered by title alphabetically' do
        expect(Item.order_by_title.first).to eq item1
      end

      it 'returns empty items collection array if there is no item object' do
        Item.destroy_all
        expect(Item.order_by_title).to eq []
      end
    end
  end
end
