module ApplicationHelper
  def credit_show()
    "**** **** **** " + @default_card_information.last4
  end

  def credit_addition 
    exp_month = @default_card_information.exp_month.to_s
    exp_year = @default_card_information.exp_year.to_s.slice(2,3)
    exp_month + " / " + exp_year
  end
end
