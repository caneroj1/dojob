module Certification
  class Certification
    attr_accessor :title, :expiration
    def initialize(title, exp)
      self.title, self.expiration = title, exp
    end
  end
end
