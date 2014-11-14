module Survey
  class BaseSurvey
    # for serialization in ActiveRecord
    class << self
      def load(json)
        json = JSON.parse(json)
        results_hash = { experience: json["experience"],
                         misc: json["misc"],
                         age_range: json["age_range"],
                         number_kids: json["number_kids"] }
        ccs = self.new(results_hash)
        ccs.certifications = []
        json["certifications"].each { |el| ccs.certifications << Certification::Certification.new(el["title"], el["expiration"]) }
        ccs
      end

      def dump(obj)
        unless obj.is_a?(self)
          raise ::ActiveRecord::SerializationTypeMismatch "Attribute was supposed to be a #{self} but was a #{obj.class}. -- #{obj.inspect}"
        end
        obj.to_json
      end
    end

    # experience is a string
    # refereces will be an array of reference objects
    # certifications will be an array of certificate objects
    # misc is string
    attr_accessor :experience, :references, :certifications, :misc
  end
end
