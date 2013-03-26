module ApplicationHelper
  def title(*names)
    content_for :title do
      (names << "Ticketee") unless names.empty?
    end
  end

  def admins_only(&block)
    block.call if current_user.try(:admin?)
    nil
  end
end
