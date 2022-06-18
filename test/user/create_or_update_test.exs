defmodule Exlivery.Users.CreateOrUpdateTest do
  use ExUnit.Case

  alias Exlivery.Users.Agent, as: UserAgent
  alias Exlivery.Users.CreateOrUpdate

  describe "call/1" do
    setup do
      UserAgent.start_link(%{})

      :ok
    end

    test "when all params are valid, saves the user" do
      params = %{
        name: "João",
        address: "Rua teste",
        email: "joao@banana.com",
        cpf: "123456",
        age: 20
      }

      response = CreateOrUpdate.call(params)

      expected = {:ok, "User created or updated successfully"}

      assert response == expected
    end

    test "when there are invalid params, returns an error" do
      params = %{
        name: "João",
        address: "Rua teste",
        email: "joao@banana.com",
        cpf: "123456",
        age: 10
      }

      response = CreateOrUpdate.call(params)

      expected = {:error, "Invalid parameters"}

      assert response == expected
    end
  end
end
