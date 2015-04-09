class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :reviews

  #before_validation :round_price
  validates_presence_of :title, :description, :price
  validates_format_of :price, with: /\A(\d*+(\.?)\d{0,2})\z/, :allow_blank => true

  def average_rating 
  	if self.reviews.any?
      total = 0.0
      self.reviews.each { |review| total += review.rating }
      return total / reviews.count
    else
      return nil
    end
  end

  def image_name
    "#{ title.downcase.gsub(' ', '') }.png"
  end

  def price_tag
    "$#{price}"
  end

  private
  def round_price
  	self.price = self.price.round(2) unless self.price == nil
  end
end
