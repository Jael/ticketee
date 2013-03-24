module ApplicationHelper
  def title(*names)
    content_for :title do
      (names << "Ticketee") unless names.empty?
    end
  end
end
