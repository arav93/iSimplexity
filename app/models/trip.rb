Airrecord.api_key = ENV['AIRTABLE_API_KEY']

class Trip < Airrecord::Table
	self.base_key = ENV['AIRTABLE_BASE_KEY']
	self.table_name = "trips"

	def choose_plan
		duration = self["Duration"]
		country = self["Country"]
		zone =  Zone.all(filter: "{Country} = '#{country}'").first["Zone"]
		plan = Plan.cheapest_and_most_affordable_in_a_specific_zone(zone, duration).first
		return false if plan.nil?
		email_content = Email.plan_activation_email(country, self["Name"],  plan["Plan Name"])
		Transaction.create({"TransactionId": SecureRandom.hex,"PlanName": plan["Plan Name"], "PlanId": plan["PlanId"], "UserEmail": self["UserEmail"]})
		PlanMailer.welcome_email(self['UserEmail'], email_content).deliver_now
		
		true
	end

end
