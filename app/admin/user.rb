ActiveAdmin.register User do
  index do |f|
    column 'Avatar' do |user|
      image_tag(user.avatar(:thumb))
    end
    column :name
    column 'description' do |user|
      user.description.html_safe if user.description?
    end
    column :email
    column :encrypted_password
    column :position_id
    if can? :all, f
      actions
    end
  end
  permit_params :avatar, :name, :description, :position_id, :avatar_crop_x, :avatar_crop_y, :avatar_crop_w, :avatar_crop_h, :email

  form do |f|
    f.inputs "Project Details" do
      f.input :avatar
      if f.object.avatar?
        f.crop_preview :avatar
        f.cropbox :avatar
      end
      f.label :name
      f.text_field :name
      f.label :email
      f.email_field :email, autofocus: true
      f.label :description
      f.cktext_area :description,  cols: 40, ckeditor: { uiColor: '#E6E8E8', toolbar: 'mini' }

      f.label :position_id
      f.collection_select :position_id, Position.all, :id, :name

    end
    f.actions
  end

  show do |user|
    attributes_table do
      row :avatar do
        image_tag(user.avatar (:thumb))
      end
      row  :name
      row 'description' do |user|
        user.description.html_safe if user.description?
      end
      row :email
      row :encrypted_password
      row  :position_id
      # Will display the image on show object page
    end
  end




end


