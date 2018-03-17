shared_context :salesforce do
  let(:schema) { Hashie::Mash.new(JSON.parse(File.read("spec/fixtures/schema.json"))) }
  let(:restforce) { double(Restforce).as_null_object }
  let(:sobject) do
    fields_json = JSON.parse(File.read("spec/fixtures/fields.json"))
    fields = []
    fields_json["fields"].each { |f| fields << Hashie::Mash.new(f) }
    SalesforceTestDataFactory::Salesforce::Sobject.new("Test_Account__c",
      "Test Account",
      fields
    )
  end
end
