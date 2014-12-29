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

        self.new(results_hash)
      end
    end

    def pet_types
      pets.join(', ')
    end
  end
end
