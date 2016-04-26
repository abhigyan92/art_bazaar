class Customer < ActiveRecord::Base
	has_many :orders, dependent: :destroy
	validates :name,  presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }

    validates :phone,:presence => true,
              :numericality => true,
              :length => { :minimum => 10, :maximum => 10 }
    validates :address,  presence: true, length: { maximum: 250 }
end
