class Product < ActiveRecord::Base
	has_many :order_items, dependent: :destroy

    default_scope { where(active: true) }
	mount_uploader :image,PictureUploader
	validates :description, presence: true, length: { maximum: 140 }
	validates :name,presence:true,length:{maximum:50},uniqueness: true
	validates :price,presence:true,numericality: { only_integer: true,
		greater_than_or_equal_to:0,less_than_or_equal_to:1000000}
	validates :image,presence:true
end
