require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user) { create(:user) }

  describe "attributes" do
    it "has name and email attributes" do
      expect(user).to have_attributes(name: "David", email: "dvcv92@gmail.com")
    end
  end
end
