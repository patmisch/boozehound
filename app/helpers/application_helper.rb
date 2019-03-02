module ApplicationHelper
  def verdict_color(verdict)
    case verdict
    when 0
      'danger'
    when 1
      'warning'
    when 2
      'success'
    else
      'dark'
    end
  end
end
