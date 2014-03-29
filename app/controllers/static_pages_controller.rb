class StaticPagesController < ApplicationController
  helper StacksHelper

  def about
  end

  def contact
  end

  def help
  end

  def home
  	@stack = Stack.new
  	@album = Album.new
  end
end
