module OffersHelper
  def format_offer_name(o)
    job = Job.select(:title).find(o.job_id)
    link_to job.title, new_comment_path(user_id: current_user.id,
                                        offer_id: o.id,
                                        job_id: o.job_id,
                                        job_title: job.title,
                                        offer_user: o.user_id), remote: true
  end

  def between(offer_user, job_id)
    # find the user_id associated with the job
    user_id = Job.select(:user_id).find(job_id)

    # if the current user owns the job associated with the offer
    if user_id.user_id.eql?(current_user.id)
      other_name = User.find(offer_user).my_name
      "#{current_user.my_name} and #{other_name}"

    # if the current user owns the offer
    else
      other_name = User.find(Job.select(:user_id).find(job_id).user_id).my_name
      "#{current_user.my_name} and #{other_name}"
    end
  end

  def format_date(date)
    current_time = Time.now
    comment_time = date.localtime
    if (current_time - comment_time) > 300 # if the comment was created more than 5 minutes ago
      if current_time - comment_time < (60 * 60 * 24) # if the comment was under a day, show minutes and seconds
        comment_time.strftime("%l:%M,  %P")
      elsif current_time - comment_time < (60 * 60 * 24 * 365) # if under a year, show month and day
        comment_time.strftime("%-m/%e")
      else # else show the year
        comment_time.strftime("%-m/%Y")
      end
    else # if less than 5 minutes, show nothing
      ""
    end
  end
end
