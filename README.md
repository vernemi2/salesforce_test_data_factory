# Salesforce Test Data Factory 

[![Build Status](https://travis-ci.org/vernemi2/salesforce_test_data_factory.svg?branch=master)](https://travis-ci.org/vernemi2/salesforce_test_data_factory)

Work in progress ruby gem generating Salesforce unit test class factories based on the object schema definition.

## Usage

clone the repository and run `bundle` to install all the dependencies.

Rename `.env.example` file to `.env` and populate with target Salesforce org credentials.

Run: `bin/console` run interactive pry session to try to use the gem. Execute following to generate test factories for Case object in Salesforce.

```
generator = SalesforceTestDataFactory::Generator.new "Case"
generator.generate!
generator.write "./out"
```

Copy files from `./out` directory to your Salesforce project with class metadata. Deploy new files to Salesforce org or run `sfdx force:source:push -u test-b4agup43oxmu@example.com` to deploy to scratch org when using Salesforce DX.
