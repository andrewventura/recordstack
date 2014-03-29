require 'rubygems'
require 'httparty'

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
		lookup = params[:lookup]
		response = HTTParty.get('release-group/', :query => {:lookup => lookup})
		data = JSON.parse(response.body)
		@release = data['query']['results']
	end

end
