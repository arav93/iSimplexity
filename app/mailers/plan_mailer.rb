class PlanMailer < ActionMailer::Base
	default from: 'from@example.com'

	def welcome_email(email, name, price, validity_days, data)
    @name = name
    @price = price
    @validity_days = validity_days
    @data = data
    mail(:to => email, :subject => "Plan activated!")
  end
end
