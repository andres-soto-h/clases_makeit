class Product < ApplicationRecord
  validates :name, presence: true

  scope :published, -> { where(published: true) }

  def word_count
    name.split.size
  end

  def profit
    "#{((price - cost) / cost) * 100}%"
  end

  def stock_status
    stock > 0
  end
end
