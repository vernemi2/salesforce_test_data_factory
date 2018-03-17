describe SalesforceTestDataFactory::Apex::ClassXml do

  include_context :salesforce

  subject { described_class.new sobject }

  describe "#file_name" do
    it "should return name of class xml file" do
      expect(subject.file_name).to eq("TestFactory_TestAccount.cls-meta.xml")
    end
  end

  describe "#version" do
    it "should return Salesforce API version" do
      expect(subject.version).to eq("42.0")
    end
  end
end
