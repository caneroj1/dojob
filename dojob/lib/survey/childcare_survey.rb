module Survey
  class ChildcareSurvey < BaseSurvey
    # both strings
    # number_kids will store the number of children the doer is willing to watch
    # age range is the range of ages willing to be watched
    attr_accessor :number_kids, :age_range

    def initialize(options = nil)
      options.each_pair { |key, val| self.send("#{key}=".to_sym, val) } if !options.nil?
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
