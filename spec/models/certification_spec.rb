require 'rails_helper'
words_regexp = /([A-z][a-z]\s*)+/
date_regexp = /[[:digit:]]{1,2}\/[[:digit:]]{1,2}\/[[:digit:]]{4}/

RSpec.describe Certification, :type => :model do

  let(:certification) { FactoryGirl.create(:certification) }

  context "Attributes" do
    it "has a title" do
      expect(certification.title).to match(words_regexp)
    end

    it "has a date added" do
      expect(certification.created_at.strftime("%-m/%d/%Y")).to match(date_regexp)
    end

    it "has an expiration date" do
      expect(certification.expires.strftime("%-m/%d/%Y")).to match(date_regexp)
    end

    it "has an optional link to site" do
      expect(certification.link).to match(words_regexp)
    end
  end
end
