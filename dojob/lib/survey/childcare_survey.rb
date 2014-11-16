module Survey
  class ChildcareSurvey < BaseSurvey
    # both strings
    # number_kids will store the number of children the doer is willing to watch
    # age range is the range of ages willing to be watched
    attr_accessor :number_kids, :age_range

    # for serialization in ActiveRecord
    class << self
      def load(json)
        return nil if json.nil?
        json = JSON.parse(json)
        results_hash = { experience: json["experience"],
                         misc: json["misc"],
                         age_range: json["age_range"],
                         number_kids: json["number_kids"] }
        ccs = self.new(results_hash)
        ccs.certifications = []
        if json["certifications"]
          json["certifications"].each { |el| ccs.certifications << Certification::Certification.new(el["title"], Time.parse(el["expiration"]).getutc) }
          ccs.certifications.sort! { |c1, c2| c1.expiration <=> c2.expiration }
        end
        ccs
      end
    end

    def age_range_vals
      if self.nil?
        return [4, 14]
      else
        data = self.age_range.split(' - ')
        [data[0].to_i, data[1].split(' ')[0].to_i]
      end
    end

    def kids
      if self.nil?
        return 1
      else
        self.number_kids
      end
    end
  end
end
