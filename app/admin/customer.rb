ActiveAdmin.register Customer do

  index do
    column 'Avatar' do |ad|
      image_tag(ad.avatar(:thumb))
    end
    column :name
    column :description
    column :position_id

    actions
  end
  permit_params :avatar, :name, :description, :position_id, :avatar_crop_x, :avatar_crop_y, :avatar_crop_w, :avatar_crop_h

  form do |f|
    f.inputs "Project Details" do
      f.input :avatar
      if f.object.avatar?
        f.crop_preview :avatar
        f.cropbox :avatar, :width => 600
      end
      f.label :name
      f.text_field :name
      f.label :description
      f.text_area :description
      f.label :position_id
      f.collection_select :position_id, Position.all, :id, :name

    end
    f.actions
  end

  show do |ad|
    attributes_table do
      row :avatar do
        image_tag(ad.avatar (:thumb))
      end
      # Will display the image on show object page
    end
  end
end
