require 'spec_helper'
require 'support/fake_classes/uri'

describe UserCallbacks do

  before do
    UserCallbacks.enabled = true
  end
  
  let(:user) { double('User', name: "Hans") } 

  it "calls url" do
    URI.should_receive(:open).with(/new_user=Hans\Z/)
    UserCallbacks.new.after_create(user)
  end

  it "does not call url when callbacks are disabled" do
    UserCallbacks.enabled = false
    URI.should_not_receive(:open)
    UserCallbacks.new.after_create(user)
  end

end
