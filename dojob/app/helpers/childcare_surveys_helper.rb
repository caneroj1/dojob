module ChildcareSurveysHelper
  def get_age_range(ccs)
    ccs.age_range_vals
  end

  def make_select_string(ccs)
    "<option " << (ccs.kids.eql?("1") ? "selected" : "") << ">1</option><option " << (ccs.kids.eql?("2") ? "selected" : "") << ">2</option><option " << (ccs.kids.eql?("3") ? "selected" : "") << ">3</option><option " << (ccs.kids.eql?("4")  ? "selected" : "") << ">4</option><option " << (ccs.kids.eql?("5+") ? "selected" : "") << ">5+</option>"
  end

  def format_number_kids(val)
    if !val.eql?("1") || !val.eql?("5+")
      val << " or fewer"
    end
  end
end
