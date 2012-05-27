class Product < ActiveRecord::Base
  has_many :appointments
  attr_accessible :block_matrix, :name, :price

end
