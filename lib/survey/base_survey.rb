module Survey
  class BaseSurvey
    # experience is a string
    # refereces will be an array of reference objects
    # certifications will be an array of certificate objects
    # misc is string
    attr_accessor :experience, :misc

    def self.dump(obj)
      if obj.is_a?(self)
        obj.to_json
      else
        nil
      end
    end

    def initialize(options = nil)
      options.each_pair { |key, val| self.send("#{key}=", val)}
    end
  end
end
