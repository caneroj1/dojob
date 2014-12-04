module ProfilesHelper
  def format_name(first_name, last_name)
    first_name << " " << last_name
  end

  def format_email(email)
    email ||= "No email given"
  end

  def format_number(number)
    if number
      make_human_readable(number)
    else
    "No number given"
    end
  end

  def make_human_readable(number)
    "(" << number[0..2] << ") " << number[3..5] << "-" << number[6..9]
  end
end
