require 'mechanize'
require 'rest-client'

# @agent = Mechanize.new

@domains, @proxy_port = '203.195.222.118', 8008

# @agent.set_proxy @domains, @proxy_port
RestClient.proxy = "http://#{@domains}:#{@proxy_port}"



# begin
#   url = "http://www.i-neeq.com/cn/quotedata/quoteSW.aspx?ItemCode=7"
#   data = @agent.get(url).search('div#div_popCategorySW')
#   p 'success:'
#   p data
# rescue => ex
#   p 'error: '
#   p ex.inspect
# end

begin
  url = "http://www.i-neeq.com/cn/quotedata/quoteSW.aspx?ItemCode=7"
  data = RestClient.get url
  p 'success:', data
rescue => ex
  p 'error:', ex.inspect
end