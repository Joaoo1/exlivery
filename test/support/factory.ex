defmodule Exlivery.Factory do
  use ExMachina

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
end
