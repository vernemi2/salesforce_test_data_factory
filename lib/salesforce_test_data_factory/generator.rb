module SalesforceTestDataFactory
  class Generator

    def initialize objects=[]
      @salesforce = Salesforce::Client.new
      @objects = Array(objects).freeze
    end

    def generate!
      @results = []
      @objects.each do |object|
        sobject = @salesforce.sobject object
        @results << Apex::Class.new(sobject)
      end
    end

    def write path
      @results.each do |r|
        File.write path + "/#{r.name}.cls", r.create
        File.write path + "/#{r.name}.cls-meta.xml", r.create_xml_file
      end
    end

    def print
      @results.each { |r| puts r.create }
    end
  end
end
