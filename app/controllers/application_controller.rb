class ApplicationController < ActionController::Base

  def launch
    render({:template => "/exchange/main.html.erb"})
  end 

  def list
    @raw_data = open("https://api.exchangerate.host/symbols").read
    @parse_data = JSON.parse(@raw_data)
    @symbols_hash = @parse_data.fetch("symbols").keys

    render({:template => "/exchange/forex.html.erb"})
  end
end
