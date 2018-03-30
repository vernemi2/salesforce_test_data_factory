require 'spec_helper'

describe SalesforceTestDataFactory::Helper do

  describe ".remove_whitespaces" do
    it "should delete white space from string" do
      expect(subject.remove_whitespaces("Test String")).to eq("TestString")
    end
  end
end
