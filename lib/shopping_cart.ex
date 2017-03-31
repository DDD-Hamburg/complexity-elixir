defmodule ShoppingCart do
  def calculate_total(cart, discount, discountedItemIds) do
    total = Enum.reduce(
      cart,
      0,
      fn {_, elem}, acc ->
	acc + String.to_float(Map.get(elem, "pricePerUnit")) * String.to_integer(Map.get(elem, "quantity"))
      end
    )
    isDiscounted = Enum.any?(cart, fn {_, elem} -> Map.get(elem, "itemId") in Map.values(discountedItemIds) end)
    case isDiscounted do
      :true -> total * discount
      :false -> total
    end
  end
end
