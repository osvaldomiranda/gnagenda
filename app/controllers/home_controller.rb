class HomeController < ApplicationController
  before_filter :authenticate_user! 

  respond_to :html

  def index  
    vta_anual_item = "SELECT name, to_char(date_trunc('month', CAST(start_time AS DATE)), 'YYYY-MM-DD') AS date , count(*) AS sum FROM schedules WHERE id_centro=24 AND CAST(start_time AS DATE) > date_trunc('month', CURRENT_DATE) - INTERVAL '13 months'  GROUP BY name,date ORDER BY name "
    @vta_anual_item = ActiveRecord::Base.connection.execute(vta_anual_item).to_a 
    @vta_anual_item = @vta_anual_item.map{|a| {[a["name"],a["date"]]=>a["sum"]}}
    @vta_anual_item = @vta_anual_item.reduce({}, :merge)
  end



end

