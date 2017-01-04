defmodule BusinessLogic.TotalController do
  use BusinessLogic.Web, :controller
  
  def create(conn, params) do
    cart = Map.get(params, "cart")
    discount = String.to_float(Map.get(params, "discount")) 
    discountedItemIds = Map.get(params, "discountedItemIds", %{})
    total = ShoppingCart.calculate_total(cart, discount, discountedItemIds)
    render(conn, "index.json", %{value: total})
  end

end
