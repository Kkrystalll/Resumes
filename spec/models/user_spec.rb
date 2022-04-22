require 'rails_helper'

RSpec.describe User, type: :model do
  # before do
  #   @user = create(:user, password: "12345678")
  # end
  let(:user) {create(:user, password: "12345678")}

  #每一個測試都是獨立的

  it "username不能重複" do
    username = "nnn"
    #arrange
    FactoryBot.create(:user, username: username)
    #act
    # user = FactoryBot.build(:user, username: username)

    expect{FactoryBot.create(:user, username: username)}.to raise_error(ActiveRecord::RecordInvalid)
    # user.save
    #assertion
    # expect(user.errors.any?).to be true
  end


  it "使用者可以登入" do
    # user = create(:user, password: "12345678")

    user_data = {
      account: user.username,
      password: "12345678"
    }

    expect(User.login(user_data)).not_to be nil
  end

  it "註冊時密碼會加密" do
    # user = create(:user, password: "12345678")

    expect(user.password).not_to eq "12345678"
    # expect(user.password.length).to be 40
  end
end
