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
        @results << Apex::ClassXml.new(sobject)
      end
    end

    def write path
      @results.each do |r|
        File.write path + "/#{r.file_name}", r.render
      end
    end

    def print
      @results.each { |r| puts r.render }
    end
  end
end
