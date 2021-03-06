defmodule Reminder.BillsTest do
  use Reminder.DataCase

  alias Reminder.Bills

  describe "bills" do
    alias Reminder.Bills.Bill

    @valid_attrs %{description: "some description", name: "some name", price: 42}
    @update_attrs %{description: "some updated description", name: "some updated name", price: 43}
    @invalid_attrs %{description: nil, name: nil, price: nil}

    def bill_fixture(attrs \\ %{}) do
      {:ok, bill} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Bills.create_bill()

      bill
    end

    test "list_bills/0 returns all bills" do
      bill = bill_fixture()
      assert Bills.list_bills() == [bill]
    end

    test "get_bill!/1 returns the bill with given id" do
      bill = bill_fixture()
      assert Bills.get_bill!(bill.id) == bill
    end

    test "create_bill/1 with valid data creates a bill" do
      assert {:ok, %Bill{} = bill} = Bills.create_bill(@valid_attrs)
      assert bill.description == "some description"
      assert bill.name == "some name"
      assert bill.price == 42
    end

    test "create_bill/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Bills.create_bill(@invalid_attrs)
    end

    test "update_bill/2 with valid data updates the bill" do
      bill = bill_fixture()
      assert {:ok, %Bill{} = bill} = Bills.update_bill(bill, @update_attrs)
      assert bill.description == "some updated description"
      assert bill.name == "some updated name"
      assert bill.price == 43
    end

    test "update_bill/2 with invalid data returns error changeset" do
      bill = bill_fixture()
      assert {:error, %Ecto.Changeset{}} = Bills.update_bill(bill, @invalid_attrs)
      assert bill == Bills.get_bill!(bill.id)
    end

    test "delete_bill/1 deletes the bill" do
      bill = bill_fixture()
      assert {:ok, %Bill{}} = Bills.delete_bill(bill)
      assert_raise Ecto.NoResultsError, fn -> Bills.get_bill!(bill.id) end
    end

    test "change_bill/1 returns a bill changeset" do
      bill = bill_fixture()
      assert %Ecto.Changeset{} = Bills.change_bill(bill)
    end
  end
end
