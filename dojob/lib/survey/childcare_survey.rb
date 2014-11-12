module Survey
  class ChildcareSurvey < BaseSurvey
    # both strings
    # number_kids will store the number of children the doer is willing to watch
    # age range is the range of ages willing to be watched
    attr_accessor :number_kids, :age_range
  end
end
