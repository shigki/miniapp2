class Blog < ActiveRecord::Base
	belongs_to :user
	validates :title, :text, :image, presence: true
end
