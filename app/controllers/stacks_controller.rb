require 'rubygems'
require 'HTTParty'
require 'Nokogiri'

class StacksController < ApplicationController
	include HTTParty
	headers 'User-Agent' => 'RecordStackBacklogs/0.1'
	base_uri 'http://musicbrainz.org/ws/2/'
	format :json
	def all
		render json: Stacks.order_by(:name, :asc)
	end

	def index

	end

	def show
		@stacks = Stack.find_by(id: params[:id])
		if @stack = nil?
			@stack = Stack.all
			redirect_to action: :index
		end
	end

	def search
		artist = Array.new

		url = "http://musicbrainz.org/ws/2/release-group/"
		lookup = params[:lookup]
		response = HTTParty.get(url, :query => {"query" => lookup, "releasegroup" => "Sunbather"})
		xml_data = response.body
		doc = Nokogiri::XML(xml_data)
		@results = doc.css('release-group > title').collect {|title| title.text.strip}
		@mbid = doc.xpath('//@id').collect {|mbid| mbid.text.strip}
	end

end
