
describe User do
  it "has a valid factory" do
    expect(FactoryGirl.create(:user)).to be_valid
  end

  it "has an email"
  it "has a state"
  it "has a city"
  it "has a zip"
  it "has a first name"
  it "has a last name"
  it "has a password"
  it "has an address"
  it "can be paid"
  it "is invalid without email"
  it "is invalid without state"
  it "is invalid without city"
  it "is invalid without zip"
  it "is invalid without first name"
  it "is invalid without last name"
  it "is invalid without address"
end
