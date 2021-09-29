defmodule Reminder.Bills.Bill do
  use Ecto.Schema
  import Ecto.Changeset

  schema "bills" do
    field :description, :string
    field :name, :string
    field :price, :integer
    field :due_date, :date

    timestamps()
  end

  @doc false
  def changeset(bill, attrs) do
    bill
    |> cast(attrs, [:name, :description, :price])
    |> validate_required([:name, :description, :price])
  end
end
