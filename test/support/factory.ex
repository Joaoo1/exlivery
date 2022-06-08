defmodule Exlivery.Factory do
  use ExMachina

  alias Exlivery.Orders.{Item, Order}
  alias Exlivery.Users.User

  def user_factory do
    %User{
      name: "Joao",
      email: "teste@email.com",
      cpf: "12312312300",
      age: 20,
      address: "Rua teste"
    }
  end

  def item_factory do
    %Item{
      description: "Pizza",
      category: :pizza,
      unity_price: Decimal.new("35.5"),
      quantity: 1
    }
  end

  def order_factory do
    %Order{
      delivery_address: "Rua teste",
      items: [
        build(:item),
        build(:item, description: "Temaki", category: :japonesa)
      ],
      total_price: Decimal.new("71.00"),
      user_cpf: "12312312300"
    }
  end
end
