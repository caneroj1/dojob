class HardOffersController < ApplicationController
  def create
    @hard_offer = HardOffer.create( price: params[:price],
                                    date_of_job: parse_date(params[:date]),
                                    user_id: params[:id],
                                    job_id: params[:job_id],
                                    username: current_user.my_name )

    params[:id] = params[:id].to_i
    respond_to do |format|
      format.js { render layout: false }
    end
  end

  protected
  def parse_date(date)
    data = date.split('/')
    DateTime.new(data[2].to_i, data[0].to_i, data[1].to_i)
  end
end
