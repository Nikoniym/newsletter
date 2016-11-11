class AddAvatarAndNameAndDescriptionToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :avatar, :attachment
    add_column :users, :name, :text
    add_column :users, :description, :text
    add_belongs_to :users, :position
  end
end
