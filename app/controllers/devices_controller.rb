class DevicesController < ApplicationController
  # GET /devices
  # GET /devices.json

  def sendMovement
    device = Device.find_by_name(params[:device])
    if device == nil 
      device = Device.new(:name => params[:device])
      if device.save
        DeviceLog.setLog(device.id, "movement", "")
        DeviceLog.setLog(2, "gas", "")
        render json: { created: true}
      else 
        render json: { created: false}
      end
    else
      DeviceLog.setLog(device.id, "movement", "")
      render json: { created: true}
      
    end
    IpConfig.sendAlert("Se acaba de abrir una puerta o ventana del dispositivo " + params[:device], 1 )
  end

  def getLastLog
    render json: DeviceLog.find(:all, :order => "id desc", :limit => 5, :select => "tipo, created_at").to_json
  end


  def index
    @devices = Device.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @devices }
    end
  end

  # GET /devices/1
  # GET /devices/1.json
  def show
    @device = Device.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @device }
    end
  end

  # GET /devices/new
  # GET /devices/new.json
  def new
    @device = Device.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @device }
    end
  end

  # GET /devices/1/edit
  def edit
    @device = Device.find(params[:id])
  end

  # POST /devices
  # POST /devices.json
  def create
    @device = Device.new(params[:device])

    respond_to do |format|
      if @device.save
        format.html { redirect_to @device, notice: 'Device was successfully created.' }
        format.json { render json: @device, status: :created, location: @device }
      else
        format.html { render action: "new" }
        format.json { render json: @device.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /devices/1
  # PUT /devices/1.json
  def update
    @device = Device.find(params[:id])

    respond_to do |format|
      if @device.update_attributes(params[:device])
        format.html { redirect_to @device, notice: 'Device was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @device.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /devices/1
  # DELETE /devices/1.json
  def destroy
    @device = Device.find(params[:id])
    @device.destroy

    respond_to do |format|
      format.html { redirect_to devices_url }
      format.json { head :no_content }
    end
  end
end
