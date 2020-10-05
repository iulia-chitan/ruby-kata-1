require 'csv'

module CsvParser
	def build_data		 
		resources = []
		class_var = self.class_variables.first
		CSV.foreach(self::DATA_PATH, headers: true, header_converters: :symbol, col_sep: ';') do |row|
			attr_hash = {}

			self::ATTR_LIST.map(&:to_sym).each do |attr_name|
  				attr_hash[attr_name] = row.to_h[attr_name]
			end
  			resources << self.new(attr_hash)
		end
		self.class_variable_set(class_var, resources)
	end
end