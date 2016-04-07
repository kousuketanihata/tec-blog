class Article < ActiveRecord::Base
	belongs_to :user

	validates :title, presence: true ,length: { minimum: 1 }   
	validates :content, presence: true ,length: { minimum: 1 } 
end
