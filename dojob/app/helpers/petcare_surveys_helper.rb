module PetcareSurveysHelper
  def format_pets(pets)
    inner_li = content_tag(:div)
    pets.split(',').each { |pet| inner_li.concat content_tag(:li, pet) }
    content_tag(:ul) { inner_li }
  end
end
