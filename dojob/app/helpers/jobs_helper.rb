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

  def format_tags_show(tag_arr)
    inner_li = content_tag(:div, "")
    tag_arr.each do |tag|
      inner_li.concat content_tag(:li) { link_to tag.tag_name, search_jobs_path(:tag => tag.tag_name), method: :post }
    end
    content_tag(:ul, "", class: "list-unstyled") { inner_li }
  end

  def format_description(desc)
    res = desc.split(" ")
    if res.count < 12
      desc[0..26] << "..."
    else
      str = ""
      (0...12).each { |i| str << res[i] << " " }
      str << "..."
    end
  end

  def format_tags(job)
    all_tags = job.tags
    inner_li = content_tag(:div, "")
    all_tags.each { |tag| inner_li.concat link_to "##{tag.tag_name}", search_jobs_path(:tag => tag.tag_name), method: :post, class: "tag-link" }
    content_tag(:div, "") { inner_li }
  end
end
