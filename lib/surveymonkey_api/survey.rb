module Surveymonkey
  # Survey
  class Survey
    attr_reader :id

    def initialize(id)
      @id = id
    end

    def details(options = {})
      @details ||= client.survey_details(id, options)
    end

    def raw_responses(options = {})
      client.survey_responses(id, options)
    end

    def responses(options = {})
      @responses ||= client.survey_responses(id, options)['data'].each_with_object([]) do |response, arr|
        arr << Surveymonkey::Response.new(id, response['id'])
      end
    end

    private

    def client
      @client ||= Surveymonkey::Client.new
    end
  end
end
