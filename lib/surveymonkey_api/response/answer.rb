module Surveymonkey
  # Response Answer
  class Response::Question::Answer
    attr_reader :id, :raw_data

    def initialize(raw_data)
      @raw_data = raw_data
      @id = raw_data['choice_id'] || raw_data['other_id']
    end

    # Match answer titles
    def title
      if raw_data['other_id']
        raw_data['text']
      else
        # match
      end
    end

  end
end
