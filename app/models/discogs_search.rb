require 'rubygems'
require 'httparty'

class DiscogsSearch
	include HTTParty
	base_uri 'api.discogs.com'
	default_params :output => 'json'
	format :json

	def self.search_album(album)
		get('/releases/', :query => {:album => album})
	end

end