defmodule BusinessLogic.TotalView do
  use BusinessLogic.Web, :view

  def render("index.json", %{value: total}) do
    total
  end
end
