module Surveymonkey
  # Response
  class Response
    extend Forwardable
    attr_reader :survey_id, :id, :survey_structure

    def initialize(survey_id, id)
      @survey_id = survey_id
      @id = id
      @survey_structure = Surveymonkey::Survey.new(survey_id)
    end

    def raw_details(options = {})
      @raw_details ||= client.survey_response(survey_id, id, options)
    end

    def info
      raw_details.dup.tap { |h| h.delete('pages') }
    end

    def pages(options = {})
      @pages ||= raw_details(options)['pages'].each_with_object([]) do |page, arr|
        unless page['questions'].empty?
          page_structure = details['pages'].detect { |p| p['id'] == page['id'] }
          arr << Surveymonkey::Response::Page.new(page, page_structure)
        end
      end
    end

    def_delegators :@survey_structure, :details

    private

    def client
      @client ||= Surveymonkey::Client.new
    end
  end
end
