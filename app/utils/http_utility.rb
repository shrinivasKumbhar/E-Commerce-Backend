#require 'net/http'
require 'net/https'
class HTTPUtility


  def self.https_get(url)
    Rails.logger.info{"#{__FILE__} :##{__LINE__} http_get method start"}
    request = HTTPI::Request.new(url)
    response = HTTPI.get(request)
    Rails.logger.info{"#{__FILE__} :##{__LINE__} UUUUUUUUUUUUU#{response}"}
    Rails.logger.info{"#{__FILE__} :##{__LINE__} UUUUUUUUUUUUU#{response.body}"}
# and pass it to a request method
#HTTPI.get(request)
    # Rails.logger.info{"#{__FILE__} :##{__LINE__} UUUUUUUUUUUUU#{url}"}
    # uri = URI.parse(url)
    # Rails.logger.info{"#{__FILE__} :##{__LINE__} ppppppppppp#{uri.port} $$$$#{uri.host}"}
    # http = Net::HTTP.new(uri.host,uri.port)
    # http.use_ssl = true
    # Rails.logger.info{"#{__FILE__} :##{__LINE__} RRRRRR#{uri.request_uri}"}
    # request = Net::HTTP::Get.new(uri.request_uri)
    # Rails.logger.info{"#{__FILE__} :##{__LINE__} request :: #{request}"}
    # response = http.request(request)
    # Rails.logger.info{"#{__FILE__} :##{__LINE__} response :: #{response}"}
    # response_body = response.body
    # Rails.logger.info{"#{__FILE__} :##{__LINE__} response_body :: #{response_body}"}
    # response_status = response.status
    # response_header = response["header-here"]
    # Rails.application.secrets.key_name
    Rails.logger.info{"#{__FILE__} :##{__LINE__} http_get method end"}
  end
end
