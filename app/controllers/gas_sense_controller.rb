class GasSenseController < ApplicationController
  def sendValue
    data = GasSense.new(:value => params[:gas])
    if data.save
      render json: { created: true}
    else
      render json: { created: false}
    end
  end
  def getValue
    if params[:date]
      data = GasSense.where("created_at > ?",  params[:date]).first
    else
      data = GasSense.where("created_at > ?",  Time.now - 10.minutes).first
    end
    if data != nil
      render json: { value: data.value}
    else
      render json: { value: nil}
    end
  end
  def getValueArray
    render json: GasSense.find(:all, :order => "id desc", :limit => 5, :select => "value").to_json
  end
end
