describe SalesforceTestDataFactory::Apex::ClassType do

  include_context :salesforce

  subject { described_class.new sobject }

  describe "#name" do
    it "should return class type name" do
      expect(subject.name).to eq("TestFactory_TestAccount")
    end
  end
end
