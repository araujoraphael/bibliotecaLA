class Livro < ActiveRecord::Base
  validates :codigo, presence: true, format: { with:  /^\d{3}\/[a-z]{1}$/i }, uniqueness: true
  validates :titulo, presence: true, length: { minimum: 4 }
  validates :autor, presence: true, length: { minimum: 4 }

  #def to_param
    #self.codigo.split(/\//).join('-')
  #end
  
  def emprestimo_atual
    self.emprestimos.where('data_devolucao IS NULL').first
  end
  
  has_many :emprestimos
   
end
