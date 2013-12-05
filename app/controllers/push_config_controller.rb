class PushConfigController < ApplicationController
  def new_device
    a = Gcm::Device.new(:registration_id => params[:regId])
    if a.save
      render json: { created: "ok"}
    else
      render json: { created: "no"}
    end
  end

  def remove_device
    render json: { created: "ok"}
  end

end
