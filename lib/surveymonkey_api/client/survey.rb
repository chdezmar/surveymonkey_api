module Surveymonkey
  class Client
    # Survey endpoints
    module Survey

      # Return all surveys in an array
      def surveys(options = {})
        response = self.class.get('/surveys', { query: options })
        response.parsed_response
      end

      # Return survey folders
      def survey_folders(options = {})
        response = self.class.get("/survey_folders", { query: options })
        response.parsed_response
      end

      # Return survey details (survey structure)
      def survey_details(survey_id, options = {})
        response = self.class.get("/surveys/#{survey_id}/details", { query: options })
        response.parsed_response
      end

      # Return all survey responses
      def survey_responses(survey_id, options = {})
        response = self.class.get("/surveys/#{survey_id}/responses/bulk", { query: options })
        response.parsed_response
      end

      # Return survey responses
      def survey_response(survey_id, response_id, options = {})
        response = self.class.get("/surveys/#{survey_id}/responses/#{response_id}/details", { query: options })
        response.parsed_response
      end
    end
  end
end
