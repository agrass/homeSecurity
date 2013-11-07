class DataFile < ActiveRecord::Base
  attr_accessible :filename

  def self.save(upload)
    puts params
    name =  upload['image'].original_filename    
    directory = "public/images"
    # create directory if it doesn't exist
  	Dir.mkdir("public/images") unless File.exists?("public/images")
    # create the file path
    path = File.join(directory, name)
    # write the file
    File.open(path, "wb") { |f| f.write(upload['image'].read) }

    DataFile.create(:filename => name)
  end
end
