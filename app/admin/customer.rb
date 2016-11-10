ActiveAdmin.register Customer do

  index do
    column 'Avatar' do |user|
      image_tag(user.avatar(:thumb))
    end
    column :name
    column 'description' do |user|
      user.description.html_safe
    end
    column :position_id
    javascript_include_tag Ckeditor.cdn_url
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
      # f.text_area :description
      # f.cktext_area :description, class: 'someclass', ckeditor: { language: 'uk'}
      # f.cktext_area :description, value: 'Default value', id: 'sometext'
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
        user.description.html_safe
      end
      row  :position_id
      # Will display the image on show object page
    end
  end
end
