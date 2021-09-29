defmodule ReminderWeb.BillView do
  use ReminderWeb, :view

  def bill_headers() do
    [
      "Name",
      "Description",
      "Price",
      "Due Date",
      ""
    ]
  end
end
