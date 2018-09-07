module Surveymonkey
  # Response Answer
  class Response::Question::Answer
    attr_reader :id, :raw_data, :answer_structure

    def initialize(raw_data, answer_structure)
      @raw_data = raw_data
      @id = raw_data['choice_id'] || raw_data['other_id']
      @answer_structure = answer_structure
    end

    # Match answer title
    def title
      @title ||= if raw_data['text']
                   raw_data['text']
                 else
                   answer_structure['choices'].detect { |c| c['id'] == id }['text']
                 end
    end
  end
end
