module TutoringSurveysHelper
  def format_science_subjects(subjects)
    inner_li = content_tag(:div)
    subjects.split(',').each { |sub| inner_li.concat content_tag(:li, sub, class: "sub-bullet") }
    content_tag(:ul, class: "sub-list") { inner_li }
  end

  def format_math_subjects(subjects)
    inner_li = content_tag(:div)
    subjects.split(',').each { |sub| inner_li.concat content_tag(:li, sub, class: "sub-bullet") }
    content_tag(:ul, class: "sub-list") { inner_li }
  end

  def format_languages(langs)
    inner_li = content_tag(:div)
    langs.split(',').each { |sub| inner_li.concat content_tag(:li, sub, class: "sub-bullet") }
    content_tag(:ul, class: "sub-list") { inner_li }
  end

  def format_instruments(ints)
    inner_li = content_tag(:div)
    ints.split(',').each { |sub| inner_li.concat content_tag(:li, sub, class: "sub-bullet") }
    content_tag(:ul, class: "sub-list") { inner_li }
  end
end
