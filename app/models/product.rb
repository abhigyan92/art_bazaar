class Product < ActiveRecord::Base
	has_many :order_items, dependent: :destroy

    default_scope { where(active: true) }
	mount_uploader :image,PictureUploader
	validates :description, presence: true, length: { maximum: 140 }
	validates :name,presence:true,length:{maximum:50}
	validates :price,presence:true
end
