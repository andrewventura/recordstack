module StacksHelper
  def search
	  response = get('/release-group/', :query => {:album => album})
	  data = JSON.parse(response.body)
	  @release = data['query']['results']
  end
end
