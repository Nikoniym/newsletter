class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.attachment :avatar
      t.text :name
      t.text :description

      t.timestamps
    end
  end
end
