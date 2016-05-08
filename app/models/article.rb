class Article < ActiveRecord::Base
	belongs_to :user
	validates :content, presence: true ,length: { minimum: 1 }
	def self.find_word(search)
		if search # Controllerから渡されたパラメータが!= nilの場合は、titleカラムを部分一致検索
      		Article.where(['title LIKE ?', "%#{search}%"])
    	else
      		Article.all
    	end
	end
end