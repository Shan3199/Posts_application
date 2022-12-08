class AfterPaymentJob < ApplicationJob
  queue_as :default

  def perform(object)
    if object.razorpay_payment_id.present?
      payment =  Razorpay::Payment.fetch(object.razorpay_payment_id) 
      object.update_column(:payment_status,payment.status)
    end  
  end
end
