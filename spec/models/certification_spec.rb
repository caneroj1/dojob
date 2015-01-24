require 'rails_helper'
words_regexp = /([A-z][a-z]\s*)+/
date_regexp = /[[:digit:]]{1,2}\/[[:digit:]]{1,2}\/[[:digit:]]{4}/

RSpec.describe Certification, :type => :model do

  let(:certification)   { FactoryGirl.create(:certification) }
  let(:user)            { FactoryGirl.create(:user) }
  let(:user_with_certs) { FactoryGirl.create(:user_with_certifications) }

  it "has a valid factory" do
    expect(FactoryGirl.create(:certification)).to be_valid
  end

  context "attributes" do
    it "has a title" do
      expect(certification.title).to match(words_regexp)
    end

    it "has a date added" do
      expect(certification.acquired.strftime("%-m/%d/%Y")).to match(date_regexp)
    end

    it "has a certifying body" do
      expect(certification.certifying_body).to match(words_regexp)
    end

    it "has an expiration date" do
      expect(certification.expires.strftime("%-m/%d/%Y")).to match(date_regexp)
    end

    it "has an optional link to site" do
      expect(certification.link).to match(words_regexp)
    end

    it "is invalid without a title" do
      expect(FactoryGirl.build(:certification, title: nil)).to_not be_valid
    end

    it "is invalid without an expiration date" do
      expect(FactoryGirl.build(:certification, expires: nil)).to_not be_valid
    end

    it "is invalid without a date added" do
      expect(FactoryGirl.build(:certification, acquired: nil)).to_not be_valid
    end

    it "belongs to a user" do
      expect(user_with_certs.certifications).to_not be_blank
    end

    it "does not allow duplicate titles" do
      user.certifications << FactoryGirl.create(:certification, title: "My Certification")
      user.certifications << FactoryGirl.create(:certification, title: "My Certification")
      expect(user.certifications.count).to eq(1)
    end
  end

  context "instance methods" do
    describe '#acquire_display' do
      it "correctly formats date" do
        expect(certification.acquire_display).to match(date_regexp)
      end
    end

    describe '#expire_display' do
      it "correctly formats date" do
        expect(certification.expire_display).to match(date_regexp)
      end
    end
  end
end
