class DataFile < ActiveRecord::Base
  attr_accessible :filename, :tipo

  def self.save(upload)    
    name =  upload["filename"] 
    directory = "public/images"
    # create directory if it doesn't exist
  	Dir.mkdir("public/images") unless File.exists?("public/images")
    # create the file path
    path = File.join(directory, name)
    # write the file   
    IO.binwrite(path, upload["file"])
    #File.open(path, "wb") { |f| f.write(upload.read) }
    DataFile.create(:filename => name, :tipo => upload["type"])
    IpConfig.sendAlert("Hay movimiento un tu hogar, hay una nueva foto!", 1)
    DeviceLog.setLog(2, "photo", "")
  end
end
