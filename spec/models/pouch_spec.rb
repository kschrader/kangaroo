require File.join( File.dirname(__FILE__), '..', "spec_helper" )

describe Pouch do

  it "should be able to zip up a pouch with the correct name" do
    pouch = Pouch.new(:name => "testing")
    expected_filename = "#{Merb.root}/pouch/#{pouch.name}.zip"
    Zip::ZipFile.should_receive(:open).with(expected_filename, Zip::ZipFile::CREATE)
    File.should_receive(:chmod).with(0644, expected_filename);
    File.should_receive(:read).with(expected_filename).and_return("FILE")
    pouch.to_zip.should == "FILE"
  end

end