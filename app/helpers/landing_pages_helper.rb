module LandingPagesHelper
  def oddeven(index)
    if( index%2 == 0)
      "even"
    else
      "odd"
    end
  end
end
