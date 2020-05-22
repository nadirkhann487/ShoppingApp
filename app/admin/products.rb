ActiveAdmin.register Product do

    
   permit_params :title,:price,:description, :image,:category_ids

  form do |f|
      f.inputs "Product Details" do
      f.input :title
      f.input :price
      f.input :description
      f.input :category_ids, as: :select, collection: Category.all
      f.input :image, as: :file
    end
    f.actions
  end

 

  show do
    panel "Product Details" do
      attributes_table_for product do
        row :title
        row :price
        row :description
        row :created_at
        row :updated_at
        row :image do |ad|
          image_tag url_for(ad.image)
        end
      end
    end
  end

  
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :title, :price, :description
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :price, :description]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
