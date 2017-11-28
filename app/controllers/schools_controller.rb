class SchoolsController < ApplicationController

	def index
		@schools = Xuexiao.all
		@school_infos = @schools.map{|s| {l_address: s.l_address, l_name: s.l_name, l_lat: s.l_lat.to_f, l_lng: s.l_lng.to_f, level: s.level.to_i}}.to_json
	end
end
