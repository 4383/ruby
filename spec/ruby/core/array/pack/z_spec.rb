# -*- encoding: ascii-8bit -*-
require_relative '../../../spec_helper'
require_relative '../fixtures/classes'
require_relative 'shared/basic'
require_relative 'shared/string'
require_relative 'shared/taint'

describe "Array#pack with format 'Z'" do
  it_behaves_like :array_pack_basic, 'Z'
  it_behaves_like :array_pack_basic_non_float, 'Z'
  it_behaves_like :array_pack_no_platform, 'Z'
  it_behaves_like :array_pack_string, 'Z'
  it_behaves_like :array_pack_taint, 'Z'

  it "adds all the bytes and appends a NULL byte when passed the '*' modifier" do
    ["abc"].pack("Z*").should == "abc\x00"
  end

  it "padds the output with NULL bytes when the count exceeds the size of the String" do
    ["abc"].pack("Z6").should == "abc\x00\x00\x00"
  end

  it "adds a NULL byte when the value is nil" do
    [nil].pack("Z").should == "\x00"
  end

  it "pads the output with NULL bytes when the value is nil" do
    [nil].pack("Z3").should == "\x00\x00\x00"
  end

  it "does not append a NULL byte when passed the '*' modifier and the value is nil" do
    [nil].pack("Z*").should == "\x00"
  end
end
