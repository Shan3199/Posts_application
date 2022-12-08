class UpdatePaymentStatusJob < ApplicationJob
  queue_as :default

  def perform(*args)
    subscription = UserSubscription.all
    subscription.each do |t|
      if t.created_at.to_date < Date.today + 1.days
        t.update_column(:payment_status,"not captured")
      end
    end
  end
end
