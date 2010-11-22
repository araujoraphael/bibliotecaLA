class CreateReservas < ActiveRecord::Migration
  def self.up
    create_table :reservas do |t|
      t.string :codigo
      t.date :data_reserva

      t.timestamps
    end
  end

  def self.down
    drop_table :reservas
  end
end
