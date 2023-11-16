module Doctors::RecommendationsHelper
  def humanize_closed(status)
    status ? 'Closed' : 'Open'
  end
end
