class Item
  @@list = []
  attr_reader :id
  attr_accessor :name, :rank

  def initialize(name, rank)
    @name = name
    @rank = rank
    @id = @@list.length + 1
  end

  def self.all()
    @@list
  end


  def self.find(id)
    item_id = id.to_i()
    @@list.each do |item|
      if item.id == item_id
        return item
      end
    end
  end

  def save()
    if @@list.all? {|item| item.rank != self.rank and item.name != self.name}
      @@list.push(self)
    end
  end

  def self.clear()
    @@list = []
  end

end
