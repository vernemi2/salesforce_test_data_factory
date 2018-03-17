describe SalesforceTestDataFactory::Apex::Class do

  include_context :salesforce

  subject { described_class.new sobject }

  describe "#file_name" do
    it "should return name of apex class file" do
      expect(subject.file_name).to eq("TestFactory_TestAccount.cls")
    end
  end

  describe "#object_name" do
    it "should return name of the sobject" do
      expect(subject.object_name).to eq("Test_Account__c")
    end
  end

  let :field_values do
    field_values = []
    subject.fields.each { |f| field_values << f.values.first}
    field_values
  end

  describe "#fields" do
    it "should return line for string fields" do
      expect(field_values).to include("Test_String__c = \'Test\' + i")
    end
  end
end
