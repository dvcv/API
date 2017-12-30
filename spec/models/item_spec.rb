require 'rails_helper'

RSpec.describe Item, type: :model do
  let(:user) { create(:user) }
  let(:list) { create(:list) }
  let(:item) { create(:item) }


   describe "attributes" do
     it "has a title attribute" do
       expect(item).to have_attributes(title: "Apple")
     end
   end
end
