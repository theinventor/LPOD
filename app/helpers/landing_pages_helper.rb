module LandingPagesHelper
  def oddeven(index)
    if( index%2 == 0)
      "even"
    else
      "odd"
    end
  end
  
  def format_date(date, format = :rfc822 )
    date.to_date().to_formatted_s(format)
  end
  
  def sidebar_lp(page)
    lp = link_to image_tag(page.screen_shot.smallthumb.url.to_s, :class => "border"), page
    link_to "#{page.id} <br> #{page.industry.name} <b #{format_date(page.release_date)}", page
  end
  def sidebar_lp(page)
    if page
      content_tag :li do
        link_to image_tag(page.screen_shot.smallthumb.url.to_s, :class => "border"), page
      end
    end
  end
end
