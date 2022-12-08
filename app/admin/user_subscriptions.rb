ActiveAdmin.register UserSubscription do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :user_id, :subscription_id, :razorpay_payment_id, :subscriptions_detail_id,:razorpay_order_id, :payment_status
  #
  # or
  #
  # permit_params do
  #   permitted = [:user_id, :subscription_id, :status]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
   index do
    # selectable_column
    id_column
    column :user_id
    column :subscription_id
    column :subscriptions_detail_id
    column :razorpay_payment_id
    column :razorpay_order_id
    column :payment_status
    actions
   end
   

  form do |f|
    f.inputs do
      f.input :user_id
      f.input :subscription_id
      f.input :razorpay_order_id
      f.input :payment_status
    end
    f.actions
  end

  show do
    attributes_table do
      row :user_id
      row :subscription_id
      row :subscriptions_detail_id
      row :razorpay_payment_id
      row :razorpay_order_id
      row :payment_status
      # row :image do |ad|
      #   image_tag ad.image.url
      # end
    end        
 end



  
end
