require 'rails_helper'

RSpec.describe List, type: :model do
  let(:user) { create(:user) }
  let(:list) { create(:list)  }

   describe "attributes" do
     it "has a title attribute" do
       expect(list).to have_attributes(title: "Food")
     end
   end
end
