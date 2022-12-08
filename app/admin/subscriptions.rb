ActiveAdmin.register Subscription do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :plan_name, :amount, :rozarpay_plan_id, :subscription_id, :razorpay_payment_id,:subscription_status
  #
  # or
  #
  # permit_params do
  #   permitted = [:plan_name, :amount, :rozarpay_plan_id, :subscription_id, :razorpay_payment_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end


  index do
    selectable_column
    id_column
    column :plan_name
    column :amount
    column "rozarpay_plan_id",:rozarpay_plan_id
    column :subscription_status
    # column "subscription_id", :subscription_id
    # column "razorpay_payment_id",:razorpay_payment_id

    actions
  end
   


  form do |f|
    f.inputs do
      f.input :plan_name
      f.input :amount
      f.input :rozarpay_plan_id,label:"razorpay_plan_id" 
      f.input :subscription_status
      # f.input :subscription_id
      # f.input :razorpay_payment_id,label:"razorpay_payment_id"
    end
    f.actions
  end


 show do
    attributes_table do
      row :plan_name
      row :amount
      row :rozarpay_plan_id  
      row :subscription_status

      # row :subscription_id
      # row :razorpay_payment_id
      # row :image do |ad|
      #   image_tag ad.image.url
      # end
    end        
 end


end

