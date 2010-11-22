class Usuario < ActiveRecord::Base
  
  validates :login, presence: true, uniqueness: true, length: {minimum: 2, maximum: 20 }
  validates :senha, presence: true, length: {minimum: 4}
  
  has_many :emprestimos
  
  def to_param
    self.login
  end
  
end
