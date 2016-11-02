class AddPositionIdToUsers < ActiveRecord::Migration[5.0]
  def change
    add_belongs_to :users, :position
  end
end
