ActiveAdmin.register Entertainment do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :photo
  #
  # or
  #
  # permit_params do
  #   permitted = [:name]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  form do |f|
    f.inputs do
      f.input :name
      f.input :photo, as: :file, hint: f.object.photo.present? ? image_tag(url_for(f.object.photo), size: "50x50") : content_tag(:span, "no images found") 
    end
    f.actions
  end
  
   index do
    id_column
    column :name    
    # actions
  end
end
