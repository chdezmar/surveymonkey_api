module Surveymonkey
  # Survey
  class Survey
    def initialize(id)
      @id = id
    end

    def details(options = {})
      client.survey_details(@id, options)
    end

    def responses(options = {})
      client.survey_responses(@id, options)
    end

    private

    def client
      @client ||= Surveymonkey::Client.new
    end
  end
end
