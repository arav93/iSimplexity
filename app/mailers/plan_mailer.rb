class PlanMailer < ActionMailer::Base
	default from: 'from@example.com'

	def welcome_email(email, email_content)
    @content = email_content[:content]
    mail(:to => email, :subject => email_content[:subject])
  end
end
