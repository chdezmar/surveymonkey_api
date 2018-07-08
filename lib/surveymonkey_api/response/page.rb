module Surveymonkey
  # Response Page
  class Response::Page
    attr_reader :id, :raw_data

    def initialize(raw_data)
      @raw_data = raw_data
      @id = raw_data['id']
    end

    def questions
      raw_data['questions'].each_with_object([]) do |question, arr|
        arr << Surveymonkey::Response::Question.new(question)
      end
    end

    private

    def client
      @client ||= Surveymonkey::Client.new
    end
  end
end
