defmodule Reminder.Repo.Migrations.CreateBills do
  use Ecto.Migration

  def change do
    create table(:bills) do
      add :name, :string
      add :description, :string
      add :price, :integer
      add :due_date, :date

      timestamps()
    end

  end
end
