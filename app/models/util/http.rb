require 'uri'
module Util::Http

	def exec_get url, username = nil, password = nil
		request = HTTPI::Request.new
		request.url = URI.encode(url)
		if username && password
			request.auth.basic(username, password)
		end
		response = HTTPI.get(request)
		if response.code.to_s.start_with?("2") 
			result = ActiveSupport::JSON.decode(response.body)
			if block_given?
				return yield(result)
			else
				return result
			end
		else
			raise "http error code=#{response.code}"
		end
	end

	def exec_post url, data, username, password
		request = HTTPI::Request.new
		request.url = url
		request.body = data
		if username && password
			request.auth.basic(username, password)
		end
		response = HTTPI.post(request)
		if response.code.to_s.start_with?("2")
			result = ActiveSupport::JSON.decode(response.body) if response.body.present?
			if block_given?
				return yield(result)
			else
				return result
			end
		else
			raise "http error code=#{response.code}"
		end
	end
end