class UserSubscription < ApplicationRecord
  belongs_to :user
  belongs_to :subscription
  enum :status => [ :deactive, :active ]

  after_save :update_payment_status

  def update_payment_status
   # debugger
    # AfterPaymentJob.perform_now(self)
    # AfterPaymentJob(self).perform_later(wait: 1.minutes)
    AfterPaymentJob.set(wait: 1.minutes).perform_later(self)
    # AfterPaymentJob.set(wait: Time.now + 5.minutes).perform_later(self)

  end

end
