class Administration < ApplicationRecord
	validates :correo, presence: true  
	
	def guardar_request
		self.save if self.num.nil?
		self.update(num: self.num+1)
	end
end

