Airrecord.api_key = ENV['AIRTABLE_API_KEY']

class Plan < Airrecord::Table
	self.base_key = ENV['AIRTABLE_BASE_KEY']
	self.table_name = "plans"

	def self.cheapest_and_most_affordable_in_a_specific_zone(zone, validity_days)
		all(filter: "{Zone} = '#{zone}'", sort: { "Price" => "asc", "Price/GB" => "asc" }).select{|item| item['ValidityDays'] >= validity_days}
	end

end