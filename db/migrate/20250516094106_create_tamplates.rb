class CreateTamplates < ActiveRecord::Migration[8.0]
  def change
    create_table :tamplates do |t|
      t.timestamps
    end
  end
end
