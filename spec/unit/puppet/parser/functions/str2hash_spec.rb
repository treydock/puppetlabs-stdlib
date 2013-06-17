require 'spec_helper'

describe 'the str2hash function' do
  let(:scope) { PuppetlabsSpec::PuppetInternals.scope }

  it "should exist" do
    Puppet::Parser::Functions.function("str2hash").should == "function_str2hash"
  end

  it 'should raise a ParseError if there is less than 1 argument' do
    lambda { scope.function_str2hash([]) }.should( raise_error(Puppet::ParseError))
  end

  it 'should raise an Exception if string is not valid JSON' do
    lambda { scope.function_str2hash(['{"name"=>{"key":"value"}}']) }.should( raise_error(Exception))
  end

  it "should convert String to Hash" do
    result = scope.function_str2hash(['{"name":{"key":"value"}}'])
    result.should(eq({"name"=>{"key"=>"value"}}))
  end
end
