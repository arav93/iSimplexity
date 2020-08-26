Airrecord.api_key = ENV['AIRTABLE_API_KEY']

class Zone < Airrecord::Table
	self.base_key = ENV['AIRTABLE_BASE_KEY']
	self.table_name = "Zones"
end

