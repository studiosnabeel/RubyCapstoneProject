require './item'
require 'date'

describe Item do
  context 'Test Item class' do
    it 'should create an Item with published date provided', positive: true do
      item = Item.new publish_date: '2-3-2023'
      expect(item.publish_date).to be_instance_of(Date)
      expect(item).to have_attributes(archived: false)
    end
    it 'should return "true" for a published date is older than 10 years', positive: true do
      item = Item.new publish_date: '2000-1-10'
      item.move_to_archive
      expect(item).to have_attributes(archived: true)
    end
    it 'should return "false" published date is less than 10 years', negative: true do
      item = Item.new publish_date: '2022-10-1'
      item.move_to_archive
      expect(item).to have_attributes(archived: false)
    end
    it 'should not create an Item if published date is not provided', negative: true do
      expect { Item.new }.to raise_error(ArgumentError)
    end
  end
end
