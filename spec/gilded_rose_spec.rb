# require File.join(File.dirname(__FILE__), 'gilded_rose')
require './lib/gilded_rose'

describe GildedRose do

  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("fixme", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "fixme"
    end
    it "reduces the sellin value of the input items" do
      items = [Item.new("item", 3, 2)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq(2)
    end
    it "reduces the quality value of the input items" do
      items = [Item.new("item", 3, 2)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq(1)
    end
    it "reduces the quality value by 2 once the sell by date reached" do
      items = [Item.new("standard_item", 0, 2)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq(0)
    end
  end

end
