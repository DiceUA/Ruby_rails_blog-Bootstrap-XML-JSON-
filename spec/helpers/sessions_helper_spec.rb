require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the SessionsHelper. For example:
#
# describe SessionsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe SessionsHelper, type: :helper do
  it 'should correctly return sign in user' do
    # Let's take user from database and try to sign in
    user = User.first
    sign_in user
    expect(current_user).to eq(user)
  end

  it 'should correctly return user when sign out pressed' do
    # First step login
    user = User.first
    sign_in user
    # second step log out
    sign_out
    # expected current_user method get nil
    expect(current_user).to eq(nil)
  end
end
