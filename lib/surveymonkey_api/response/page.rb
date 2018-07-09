module Surveymonkey
  # Response Page
  class Response::Page
    attr_reader :id, :raw_data, :page_structure

    def initialize(raw_data, page_structure)
      @raw_data = raw_data
      @id = raw_data['id']
      @page_structure = page_structure
    end

    # Match page title
    def title
      @title ||= page_structure['title']
    end

    def questions
      @questions ||= raw_data['questions'].each_with_object([]) do |question, arr|
        question_structure = page_structure['questions'].detect{|q| q['id'] == question['id']}
        arr << Surveymonkey::Response::Question.new(question, question_structure)
      end
    end
  end
end
