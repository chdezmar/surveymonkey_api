module Surveymonkey
  # Response Question
  class Response::Question
    attr_reader :id, :raw_data, :question_structure

    def initialize(raw_data, question_structure)
      @raw_data = raw_data
      @id = raw_data['id']
      @question_structure = question_structure
    end

    # Match response title
    def title
      @title ||= question_structure['headings'].first['heading']
    end

    def answers
      @answers ||= raw_data['answers'].each_with_object([]) do |answer, arr|
        answer_structure = question_structure['answers']
        arr << Surveymonkey::Response::Question::Answer.new(answer, answer_structure)
      end
    end
  end
end
