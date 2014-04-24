class PushConfigController < ApplicationController
  def new_device
    if Device.find_by_key(params[:regId]) == nil
      a = Device.new(:key => params[:regId])
      if a.save
        render json: { created: "ok"}
      else
        render json: { created: "no"}
      end
    else
      render json: { created: "ok"}
    end
  end

  def remove_device
    render json: { created: "ok"}
  end

end
