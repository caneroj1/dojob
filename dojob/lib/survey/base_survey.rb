module Survey
  class BaseSurvey
    # for serialization in ActiveRecord
    class << self
      def load(obj)
        self.new(obj)
      end

      def dump(obj)
        unless obj.is_a?(self)
          raise ::ActiveRecord::SerializationTypeMismatch "Attribute was supposed to be a #{self} but was a #{obj.class}. -- #{obj.inspect}"
        end

        obj.length
      end
    end

    # experience is a string
    # refereces will be an array of reference objects
    # certifications will be an array of certificate objects
    # misc is string
    attr_accessor :experience, :references, :certifications, :misc
  end
end
