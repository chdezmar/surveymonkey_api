module Surveymonkey
  # Survey
  class Response
    attr_reader :survey_id, :id

    def initialize(survey_id, id)
      @survey_id = survey_id
      @id = id
    end

    def raw_details(options = {})
      client.survey_response(survey_id, id, options)
    end

    def pages(options = {})
      @pages ||= client.survey_response(survey_id, id, options)['pages'].each_with_object([]) do |page, arr|
        arr << Surveymonkey::Response::Page.new(page) unless page['questions'].empty?
      end
    end

    private

    def client
      @client ||= Surveymonkey::Client.new
    end
  end
end
