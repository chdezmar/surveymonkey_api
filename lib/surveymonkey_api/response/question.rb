module Surveymonkey
  # Response Question
  class Response::Question
    attr_reader :id, :raw_data

    def initialize(raw_data)
      @raw_data = raw_data
      @id = raw_data['id']
    end

    # Match response titles
    def title
      
    end

    def answers
      raw_data['answers'].each_with_object([]) do |answer, arr|
        arr << Surveymonkey::Response::Question::Answer.new(answer)
      end
    end

  end
end
