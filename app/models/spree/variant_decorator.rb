Spree::Variant.class_eval do

  include ActionView::Helpers::NumberHelper

  def to_hash(current_user = nil)
    actual_price  = self.price_for_user(current_user)
    #actual_price += Calculator::Vat.calculate_tax_on(self) if Spree::Config[:show_price_inc_vat]
    {
      :id    => self.id,
      :in_stock => self.in_stock?,
      :price => number_to_currency(actual_price),
      :quantity => self.total_on_hand
    }
  end

end
