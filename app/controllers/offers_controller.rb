class OffersController < ApplicationController
  def index
    @my_offers = Offer.where("user_id = #{current_user.id}")
    @offers_for_me = Offer.where(job_id: Job.where(user_id: current_user.id).select(:id))
  end
end
