Airrecord.api_key = ENV['AIRTABLE_API_KEY']

class Email < Airrecord::Table
	self.base_key = ENV['AIRTABLE_BASE_KEY']
	self.table_name = "emails"

	def self.plan_activation_email(location, user_name,  plan_name)
		email = all(filter: "{Name} = 'PlanActivationMail'").last
		subject = email['Subject'].gsub('{{trip.region}}', location)
		content = email['Content'].gsub('{{user.name}}', user_name).gsub('{{plan.name}}', plan_name)
		{subject: subject, content: content}
	end
end