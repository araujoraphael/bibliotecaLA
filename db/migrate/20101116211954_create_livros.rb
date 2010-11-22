class CreateLivros < ActiveRecord::Migration
  def self.up
    create_table :livros do |t|
      t.string :codigo
      t.string :titulo
      t.string :autor

      t.timestamps
    end
  end

  def self.down
    drop_table :livros
  end
end
