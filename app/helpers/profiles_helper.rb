module ProfilesHelper
  def format_name(first_name, last_name)
    first_name << " " << last_name
  end

  def format_email(email)
    email ||= "No email given"
  end

  def format_number(number)
    puts "HERE!!!"
    puts number
    if !number.nil? && !number.blank?
      make_human_readable(number)
    else
      "No number given"
    end
  end

  def make_human_readable(number)
    "(" << number[0..2] << ") " << number[3..5] << "-" << number[6..9]
  end

  def any_surveys?(user)
    !user.childcare_survey.nil? || !user.tutoring_survey.nil? || !user.handyman_survey.nil? || !user.childcare_survey.nil?
  end

  def collect_surveys(user)
    surveys = []
    if @user.childcare_survey
      def (@user.childcare_survey).name
        "Childcare Survey"
      end
      surveys.push(@user.childcare_survey)
    end

    if @user.petcare_survey
      def (@user.petcare_survey).name
        "Petcare Survey"
      end
      surveys.push(@user.petcare_survey)
    end

    if @user.tutoring_survey
      def (@user.tutoring_survey).name
        "Tutoring Survey"
      end
      surveys.push(@user.tutoring_survey)
    end

    if @user.handyman_survey
      def (@user.handyman_survey).name
        "Handyman Survey"
      end
      surveys.push(@user.handyman_survey)
    end

    surveys
  end

  def about_me_label
    "Feel free to include information about the jobs you most enjoy doing" <<
    " and anything else you think people should know. Please keep this section as professional as possible."
  end

  def user_avatar(user)
    if user.avatar.blank?
      image_tag('no-avatar.png', class: 'img-circle')
    else
      image_tag(user.avatar, class: 'img-circle')
    end
  end

  def reference_tags(reference_tags)
    if reference_tags.blank?
      content_tag(:p, "None added.")
    else
      content_tag(:p, reference_tags.map { |tag| tag.tag_name}.join(", ") )
    end
  end
end
