defmodule ShoppingCart do
  def calculate_total(cart, discount, discountedItemIds) do
    total = Enum.reduce(
      cart,
      0,
      fn {key, elem}, acc ->
	acc + String.to_float(Map.get(elem, "pricePerUnit")) * String.to_integer(Map.get(elem, "quantity"))
      end
    )
    isDiscounted = Enum.any?(cart, fn {_, elem} -> Map.get(elem, "id") in Map.values(discountedItemIds) end)
    return_value(total, isDiscounted, discount)
  end

  
  defp return_value(total, true, discount) do
    total * discount
  end

  defp return_value(total, false, discount) do
    total 
  end  
    
end
