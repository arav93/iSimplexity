Airrecord.api_key = ENV['AIRTABLE_API_KEY']

class Transaction < Airrecord::Table
	self.base_key = ENV['AIRTABLE_BASE_KEY']
	self.table_name = "transactions"
end