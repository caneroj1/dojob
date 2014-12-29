module Survey
  class HandymanSurvey < BaseSurvey
    attr_accessor :plumbing,    :plumbing_expertise,
                  :electrical,  :electrical_expertise,
                  :carpentry,   :carpentry_expertise,
                  :automotive,  :automotive_expertise,
                  :hvac,        :hvac_expertise,
                  :equipment

    # for serialization in Active Record
    class << self
      def load(json)
        return nil if json.nil?
        json = JSON.parse(json)
        results_hash ={ plumbing: json["plumbing"],
                        plumbing_expertise: json["plumbing_expertise"],
                        electrical: json["electrical"],
                        electrical_expertise: json["electrical_expertise"],
                        carpentry: json["carpentry"],
                        carpentry_expertise: json["carpentry_expertise"],
                        automotive: json["automotive"],
                        automotive_expertise: json["automotive_expertise"],
                        hvac: json["hvac"],
                        hvac_expertise: json["hvac_expertise"],
                        equipment: json["equipment"] }

        self.new(results_hash)
      end
    end
  end
end
