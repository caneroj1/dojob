module Survey
  class TutoringSurvey < BaseSurvey
    # science, math, languages, music will be arrays that will contain strings
    # of the subject
    # history will be boolean, and so will english
    attr_accessor :education, :science, :math, :experience,
                  :english, :languages, :history, :music, :other

    class << self
      def load(json)
        return nil if json.nil?
        json = JSON.parse(json)
        results_hash = { education: json["education"],
                         science: json["science"],
                         math: json["math"],
                         english: json["english"],
                         history: json["history"],
                         music: json["music"],
                         languages: json["languages"],
                         experience: json["experience"] }

        ts = self.new(results_hash)
      end
    end
  end
end
