module PetcareSurveysHelper
  def format_pets(pets)
    inner_li = content_tag(:div)
    pets.split(',').each { |pet| inner_li.concat content_tag(:li, pet, class: "animal-bullet") }
    content_tag(:ul, class: "animal-list") { inner_li }
  end
end
