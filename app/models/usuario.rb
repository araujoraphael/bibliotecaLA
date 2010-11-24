class Usuario < ActiveRecord::Base

   devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable
   
   has_many :emprestimos

  
   
   def login
     return nil if self.email.blank?
     
     self.email.split('@').first
   end
end
