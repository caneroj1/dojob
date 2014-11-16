module Survey
  class PetcareSurvey < BaseSurvey
    # pets will be an array of strings of pet type
    # for ex: dogs, cats, fish, etc.
    attr_accessor :pets

    # for serialization in ActiveRecord
    class << self
      def load(json)
        return nil if json.nil?
        json = JSON.parse(json)
        results_hash = { experience: json["experience"],
                         misc: json["misc"],
                         pets: json["pets"] }

        pcs = self.new(results_hash)
        pcs.certifications = []
        if json["certifications"]
          json["certifications"].each { |el| pcs.certifications << Certification::Certification.new(el["title"], Time.parse(el["expiration"]).getutc) }
          pcs.certifications.sort! { |c1, c2| c1.expiration <=> c2.expiration }
        end
        pcs
      end
    end

    def pet_types
      pets.join(', ')
    end
  end
end
