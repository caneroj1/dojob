module JobsHelper
  def format_frequency(j)
    case
    when j.frequency.eql?("One Time")
      "Deadline by: #{j.deadline.strftime("%-m/%d/%Y")}"
    when j.frequency.eql?("Weekly")
      "Weekly Basis"
    when j.frequency.eql?("As Needed")
      "By Poster's Need"
    end
  end

  def format_tags(tag_arr)
    str = tag_arr.join(', ')
  end

  def format_description(desc)
    res = desc.split(" ")
    str = " "
    (0...12).each { |i| str << res[i] << " " }
    str << "..."
  end
end
