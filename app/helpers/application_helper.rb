module ApplicationHelper
  def title(*names)
    content_for :title do
      (names << "Ticketee").join("-") unless names.empty?
    end
  end
end
