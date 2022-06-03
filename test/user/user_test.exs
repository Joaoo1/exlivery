defmodule Exlivery.Users.UserTest do
  use ExUnit.Case

  alias Exlivery.Users.User

  import Exlivery.Factory

  describe "build/5" do
    test "when all params are valid, returns the user" do
      response = User.build("Rua teste", "Joao", "teste@email.com", "12312312300", 20)

      expected_response = {:ok, build(:user)}

      assert response == expected_response
    end

    test "when there are invalid params, returns an error" do
      response = User.build("Rua teste", "Joao", "teste@email.com", "12345678900", 15)

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end
  end
end
