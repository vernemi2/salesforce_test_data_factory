require "mustache"
Mustache.template_path = __dir__

require "active_support"
require "active_support/core_ext"
require "salesforce_test_data_factory/version"
require "salesforce_test_data_factory/generator"
require "salesforce_test_data_factory/salesforce/client"
require "salesforce_test_data_factory/salesforce/sobject"
require "salesforce_test_data_factory/apex/class_type"
require "salesforce_test_data_factory/apex/class"
require "salesforce_test_data_factory/apex/class_xml"
require "salesforce_test_data_factory/apex/helper"

module SalesforceTestDataFactory
end
