ActiveAdmin.register Category do

  permit_params :title, :image

  form do |f|
      f.inputs "Category Details" do
      f.input :title
      f.input :image, as: :file
    end
    f.actions
  end

 

  show do
    panel "Category Details" do
      attributes_table_for category do
        row :title
        row :created_at
        row :updated_at
        row :image do |ad|
          image_tag url_for(ad.image)
        end
      end
    end
  end


  
end

