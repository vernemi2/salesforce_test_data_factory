require 'spec_helper'

describe SalesforceTestDataFactory::Salesforce::Client do
  include_context :salesforce

  before do
    allow(Restforce).to receive(:new).and_return(restforce)
  end

  describe "#sobject" do
    it "should return specified sobject" do
      expect(restforce).to receive(:describe).once.with("Case").and_return(schema)
      returned_sobject = subject.sobject "Case"
      expect(returned_sobject.name).to eq("Case")
      expect(returned_sobject.label).to eq("Case")

      returned_sobject.fields.each do |f|
        expect(f.name).to_not eq("OwnerId")
        expect(f.updateable).to eq(true)
      end
    end
  end
end
