
describe User do
  let(:user) { FactoryGirl.create(:user) }
  words_regexp = /([A-z][a-z]\s*)+/
  email_regexp = /^([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})$/i

  it "has a valid factory" do
    expect(user).to be_valid
  end

  context "attributes" do
    it "has an email" do
     expect(user.email).to match(email_regexp)
   end

    it "has a state" do
      expect(user.state).to match(words_regexp)
    end

    it "has a city" do
      expect(user.city).to match(words_regexp)
    end

    it "has a zip" do
      expect(user.zip).to match(/[0-9]{5}/)
    end

    it "has a first name" do
      expect(user.first_name).to match(words_regexp)
    end

    it "has a last name" do
      expect(user.last_name).to match(words_regexp)
    end

    it "has a password" do
      expect(user.password).to match(/(\w|[~`@#\$\%\^\&\*\(\)\_\-\=\+\{\}\[\]\|\/\\]){8,}/)
    end

    it "has an address" do
      expect(user.address).to match(words_regexp)
    end

    it "starts as a free user" do
      expect(user.paid).to eq false
    end

    it "is invalid without email" do
      expect(FactoryGirl.build(:user, email: nil)).to_not be_valid
    end

    it "is invalid without state" do
      expect(FactoryGirl.build(:user, state: nil)).to_not be_valid
    end

    it "is invalid without city" do
      expect(FactoryGirl.build(:user, city: nil)).to_not be_valid
    end

    it "is invalid without zip" do
      expect(FactoryGirl.build(:user, zip: nil)).to_not be_valid
    end

    it "is invalid without first name" do
      expect(FactoryGirl.build(:user, first_name: nil)).to_not be_valid
    end

    it "is invalid without last name" do
      expect(FactoryGirl.build(:user, last_name: nil)).to_not be_valid
    end

    it "is invalid without address" do
      expect(FactoryGirl.build(:user, address: nil)).to_not be_valid
    end

    it "is invalid without password" do
      expect(FactoryGirl.build(:user, password: nil)).to_not be_valid
    end

    it "expects email to be unique" do
      user_one = FactoryGirl.create(:user, email: "testemail@mail.com")
      expect(FactoryGirl.build(:user, email: "testemail@mail.com")).to_not be_valid
    end
  end

  context "instance methods" do
    it "#my_name returns the correctly formatted name string" do
      expect(user.my_name).to eq("#{user.first_name} #{user.last_name}")
    end
  end
end
