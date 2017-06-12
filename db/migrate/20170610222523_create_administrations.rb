class CreateAdministrations < ActiveRecord::Migration[5.1]
  def change
    create_table :administrations do |t|
      t.string :correo
      t.string :ApiKey
      t.integer :num

      t.timestamps
    end
  end
end
