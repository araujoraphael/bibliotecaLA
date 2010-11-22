class CreateEmprestimos < ActiveRecord::Migration
  def self.up
    create_table :emprestimos do |t|
      t.string :codigo
      t.references :livro
      t.references :usuario
      t.date :data_emprestimo
      t.date :data_prev_devolucao
      t.date :data_devolucao

      t.timestamps
    end
  end

  def self.down
    drop_table :emprestimos
  end
end
