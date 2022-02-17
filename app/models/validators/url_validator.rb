# URL Validator from Simone Carletti off of stackoverflow, date=8/23/11
# https://stackoverflow.com/questions/7167895/rails-whats-a-good-way-to-validate-links-urls

class UrlValidator < ActiveModel::EachValidator
	def valid_url?(uri)
		uri = URI.parse(uri) && uri.host
	rescue URI::InvalidURIError
		false
	end

	def validate_each(record, attribute, value)
		unless value.present? && self.class.valid_url?(value)
			record.errors.add(attribute, "is not a valid URL")
		end
	end
end
