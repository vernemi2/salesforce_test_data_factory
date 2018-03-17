require 'spec_helper'

describe SalesforceTestDataFactory::Salesforce::Sobject do

  describe "#initialize" do
    it "should remove whitespaces from label" do
      sobject = described_class.new "TestAccount__c", "Test Account", []
      expect(sobject.label).to eq("TestAccount")
    end
  end
end
