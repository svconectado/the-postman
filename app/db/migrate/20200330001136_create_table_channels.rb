class CreateTableChannels < ActiveRecord::Migration[6.0]
  def change
    create_table :channels do |t|
      
      t.string :owner, null: false
      t.string :service, null: false
      t.string :secret_key, null: false
      t.string :name, null: false
      t.integer :enabled, default: 1
      t.text :enviroment, null: true

      t.timestamps
    end

  end
end
