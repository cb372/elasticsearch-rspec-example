require 'spec_helper'

describe 'Search' do

  fixtures :documents

  before(:all) do
    # Tell Tire to connect to your test ES server, e.g. running on localhost
    Tire.configure { url "http://localhost:9200" }
  end

  before(:each) do
    # Create new ES index for each test, giving the index a unique name just to be sure
    Document.index_name(Document.model_name.plural + '_test_' + DateTime.now.strftime('%Y_%m_%d_%H_%M_%S'))
    Document.create_elasticsearch_index

    # Index all documents loaded from the fixture
    Document.all.each { |doc| doc.update_index }
    Document.index.refresh
  end

  after(:each) do
    # Delete the index after each test
    Document.index.delete
  end

  it 'should return matching documents' do
    results = Document.search 'hello'
    results.size.should == 1
    results.first.body.should == 'hello world'
  end
end