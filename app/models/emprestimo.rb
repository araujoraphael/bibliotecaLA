class Emprestimo < ActiveRecord::Base  
  belongs_to :livro
  belongs_to :usuario
end
