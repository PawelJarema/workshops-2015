class Category < ActiveRecord::Base
  has_many :products

  validates :name, uniqueness: { case_sensitive: true }
end
