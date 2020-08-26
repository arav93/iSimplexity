Airrecord.api_key = ENV['AIRTABLE_API_KEY']

class Trip < Airrecord::Table
	self.base_key = ENV['AIRTABLE_BASE_KEY']
	self.table_name = "trips"

	def choose_plan
		duration = self["Duration"]
		country = self["Country"]
		zone =  Zone.all(filter: "{Country} = '#{country}'").first["Zone"]
		plan = Plan.cheapest_and_most_affordable_in_a_specific_zone(zone, duration).first
		Transaction.create({"TransactionId": SecureRandom.hex,"PlanName": plan["Plan Name"], "PlanId": plan["PlanId"], "UserEmail": self["UserEmail"]})
		PlanMailer.welcome_email(self['UserEmail'], plan['Plan Name'], plan['Price'], plan['ValidityDays'], plan['DataMB']).deliver_now

	end

end
