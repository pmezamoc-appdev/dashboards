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

  def convert
    @raw_data = open("https://api.exchangerate.host/symbols").read
    @parse_data = JSON.parse(@raw_data)
    @symbols_hash = @parse_data.fetch("symbols").keys

    @initial_currency = params.fetch("symbol")
    render({:template => "/exchange/step_two.html.erb"})
  end

  def values
    @initial_currency = params.fetch("symbol_one")
    @ending_currency = params.fetch("symbol_two")
    @raw_data = open("https://api.exchangerate.host/convert?from=#{@initial_currency}&to=#{@ending_currency}").read
    @conversion = JSON.parse(@raw_data).fetch("info").fetch("rate")
    render({:template => "/exchange/step_three.html.erb"})
  end
end
