class Subscription < ApplicationRecord
     has_many :user_subscriptions
     has_many :users ,through: :user_subscriptions
     enum :subscription_status => [ :deactive, :active ]

     after_save :update_user_data

     def update_user_data
        debugger
     end
end
