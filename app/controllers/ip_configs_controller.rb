class IpConfigsController < ApplicationController
  # GET /ip_configs
  # GET /ip_configs.json
  def index
    @ip_configs = IpConfig.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ip_configs }
    end
  end

  def lastIP
      @ip = IpConfig.last.ip
      render json: { ip: @ip  }
  end
  def sendIP
    @new_ip = IpConfig.new(:ip => params[:ip])
    if @new_ip.save
      render json: { added: true}
    else
      render json: { added: false}
    end
  end



  # GET /ip_configs/1
  # GET /ip_configs/1.json
  def show
    @ip_config = IpConfig.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ip_config }
    end
  end

  # GET /ip_configs/new
  # GET /ip_configs/new.json
  def new
    @ip_config = IpConfig.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ip_config }
    end
  end

  # GET /ip_configs/1/edit
  def edit
    @ip_config = IpConfig.find(params[:id])
  end

  # POST /ip_configs
  # POST /ip_configs.json
  def create
    @ip_config = IpConfig.new(params[:ip_config])

    respond_to do |format|
      if @ip_config.save
        format.html { redirect_to @ip_config, notice: 'Ip config was successfully created.' }
        format.json { render json: @ip_config, status: :created, location: @ip_config }
      else
        format.html { render action: "new" }
        format.json { render json: @ip_config.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ip_configs/1
  # PUT /ip_configs/1.json
  def update
    @ip_config = IpConfig.find(params[:id])

    respond_to do |format|
      if @ip_config.update_attributes(params[:ip_config])
        format.html { redirect_to @ip_config, notice: 'Ip config was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ip_config.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ip_configs/1
  # DELETE /ip_configs/1.json
  def destroy
    @ip_config = IpConfig.find(params[:id])
    @ip_config.destroy

    respond_to do |format|
      format.html { redirect_to ip_configs_url }
      format.json { head :no_content }
    end
  end
end
