require 'spec_helper'
require 'support/fake_classes/uri'

describe "User" do

  before do
    UserCallbacks.enabled = true
  end  

  it "calls an URL after create" do
    UserCallbacks.any_instance.should_receive(:call_url)
    User.create!(name: "Fritz")
  end

end