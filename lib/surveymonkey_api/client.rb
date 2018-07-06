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
  end
end
