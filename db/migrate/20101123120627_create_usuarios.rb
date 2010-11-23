class CreateUsuarios < ActiveRecord::Migration
  def self.up
    create_table :usuarios do |t|
      t.string :name
      t.string :login
      t.boolean :isadmin
      t.database_authenticatable
      t.recoverable
      t.rememberable
      t.trackable

      t.timestamps
    end
  end

  def self.down
    drop_table :usuarios
  end
end
