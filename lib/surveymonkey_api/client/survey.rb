module Surveymonkey
  class Client
    # Survey endpoints
    module Survey

      # Return all surveys
      def surveys(options = {})
        response = self.class.get('/surveys', { query: options })
        response.parsed_response
      end

      # Return all survey folders
      def survey_folders(options = {})
        response = self.class.get("/survey_folders", { query: options })
        response.parsed_response
      end

      # Return surveys folder
      def survey_folder(folder_id, options = {})
        response = self.class.get("/survey_folders/#{folder_id}", { query: options })
        response.parsed_response
      end

      # Return survey details (survey structure)
      def survey_details(survey_id, options = {})
        response = self.class.get("/surveys/#{survey_id}/details", { query: options })
        response.parsed_response
      end

      # Return all survey responses paginated
      def survey_responses(survey_id, options = {})
        response = self.class.get("/surveys/#{survey_id}/responses/bulk", { query: options })
        response.parsed_response
      end


      # Return all survey responses
      def all_survey_responses(survey_id, options = {})
        response = self.class.get("/surveys/#{survey_id}/responses/bulk", { query: options })
        surveys = []
        surveys << if response['total'] > response['per_page']
                    get_all_pages(response['links'])
                  else
                    response['data']
                  end
        surveys.flatten
      end

      # Return survey response
      def survey_response(survey_id, response_id, options = {})
        response = self.class.get("/surveys/#{survey_id}/responses/#{response_id}/details", { query: options })
        response.parsed_response
      end
    end
  end
end
