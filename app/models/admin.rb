class Admin < ActiveRecord::Base
	validates :name, presence: true,length:{minimun:5,maximum:25}
	validates :password,presence:true,length:{minimum:6}
end
