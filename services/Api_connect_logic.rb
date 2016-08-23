require 'net/http'
require 'uri'
require 'cgi'

class Api_connect_logic
  def get_api (reqUrl)
    uri = URI.parse(reqUrl)
    http = Net::HTTP.new(uri.host, uri.port)

    res = http.start do
      http.get(uri.request_uri)
    end

    res_body_enc = res.body.force_encoding("UTF-8")
    return CGI.escapeHTML(res_body_enc)
  end
end
