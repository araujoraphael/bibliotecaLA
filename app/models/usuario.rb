class Usuario < ActiveRecord::Base
  
   devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable
   
   has_many :emprestimos

   def to_param
     self.login
   end
   
   def login
     return nil if self.email.blank?
     
     self.email.split('@').first
   end
end
