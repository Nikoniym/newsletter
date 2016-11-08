class CreateCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
      t.attachment :avatar
      t.text :name
      t.text :description

      t.timestamps
    end

    add_belongs_to :customers, :position
  end
end
