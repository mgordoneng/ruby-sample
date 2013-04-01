require 'httparty'

class ArticleRetriever
  include HTTParty

  def initialize
    @api_key = " 16e898c2bf28287404ebb8748fb91d7a:9:67498079"
    @query = "title%3A%22global+warming%22+org_facet%3A%5BENVIRONMENTAL+PROTECTION+AGENCY%5D&rank=oldest"
    @end_point = "http://api.nytimes.com/svc/search/v1/article"  
  end

  def read_articles_from_api
    #TODO validate response from API is 200
   uri = @end_point + "?format=json&query=" + @query + "&api-key=" + @api_key 
   response = HTTParty.get(@uri)
  end

  def read_articles_from_file(file_name)
    #TODO validate file exists and has content
    f = File.open(file_name) { |file| file.read }
  end

  def write_articles_to_file(data, file_name)
   #TODO validate data is string with content 
    f = File.new(file_name, "w")
    f.write(data)
  end

end

#obj = ArticleRetriever.new
#data =  obj.read_articles_from_api
#obj.write_articles_to_file(data, "output")
#data = obj.read_articles_from_file("output")
#puts data
