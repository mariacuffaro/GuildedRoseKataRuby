class GildedRose

  MAX_QUALITY = 50
  SELL_BY_DATE = 0

  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      item.name == 'Sulfuras, Hand of Ragnaros' ? next : update(item)
      item.quality = MAX_QUALITY if item.quality > MAX_QUALITY
      item.sell_in -= 1
    end
  end

  private

  def update(item)
    case item.name
      when 'Aged Brie' then update_aged_brie(item)
      when 'Backstage passes to a TAFKAL80ETC concert' then update_backstage(item)
      else update_standard(item)
    end
  end

  def update_aged_brie(item)
    item.sell_in > SELL_BY_DATE ? item.quality += 1 : item.quality += 2

  end

  def update_standard(item)
    item.sell_in > SELL_BY_DATE ? item.quality -= 1 : item.quality -= 2
    item.quality = 0 if item.quality < 0
  end

  def update_backstage(item)
    item.sell_in <= 10 ? item.quality += 2 : item.quality += 1
    item.quality += 1 if item.sell_in <= 5
    item.quality = 0 if item.sell_in <= SELL_BY_DATE
  end

end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s
    "#{@name}, #{@sell_in}, #{@quality}"
  end

end
