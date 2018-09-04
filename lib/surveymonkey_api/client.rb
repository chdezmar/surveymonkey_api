module Surveymonkey
  # Client
  class Client
    include HTTParty
    include Surveymonkey::Client::Survey
    base_uri 'https://api.surveymonkey.net/v3'
    format :json

    def initialize(access_token = nil)
      @access_token = access_token || ENV['SURVEYMONKEY_API_TOKEN']
      self.class.default_options.merge!(headers: { 'Authorization' => "bearer #{@access_token}" })
    end

    private

    def get_all_pages(links)
      all_data = []
      res = self.class.get(path_for(links['self']))
      all_data << res['data']
      while res['links']['next']
        res = self.class.get(path_for(res['links']['next']))
        all_data << res['data']
      end
      all_data
    end

    def path_for(url)
      URI.parse(url).request_uri[3..-1]
    end
  end
end
