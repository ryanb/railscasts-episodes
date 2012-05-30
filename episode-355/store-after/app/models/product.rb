class Product < ActiveRecord::Base
  belongs_to :category
  attr_accessible :name, :price, :category_id, :released_at, :discontinued_at, :stock

  def self.search(query)
    match(
      released_at: {lteq: Time.zone.now},
      discontinued_at: [nil, {gt: Time.zone.now}],
      stock: {gteq: 2},
      name: {matches: "%#{query}%"},
    )
  end

  # Other approaches:
  #
  # def self.search(query)
  #   where("released_at <= :now and (discontinued_at is null or discontinued_at > :now) and stock >= :stock and name like :query", now: Time.zone.now, stock: 2, query: "%#{query}%")
  # end
  #
  # scope :released,         -> { where("released_at > ?", Time.zone.now) }
  # scope :not_discontinued, -> { where("discontinued_at is null or discontinued_at > ?", Time.zone.now) }
  # scope :stock,            -> { where("stock >= ?", 2) }
  # scope :available,        -> { released.not_discontinued.available }
  # scope :search,    ->(query) { available.where("name like ?", "%#{query}%") }
  # 
  # def search(query)
  #   available.where(arel_table[:name].matches("%#{query}%"))
  # end
  #
  # generate_scopes
  # scope :not_discontinued, -> { discontinued_at_eq(nil) | discontinued_at_gt(Time.zone.now) }
  # scope :available,        -> { not_discontinued.released_at_lteq(Time.zone.now).stock_gteq(2) }
  # def search(query)
  #   available.name_matches("%#{query}%")
  # end
  #
end
