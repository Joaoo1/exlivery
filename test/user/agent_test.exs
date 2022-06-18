defmodule Exlivery.Users.AgentTest do
  use ExUnit.Case

  alias Exlivery.Users.Agent, as: UserAgent

  import Exlivery.Factory

  describe "save/1" do
    test "saves the user" do
      user = build(:user)

      UserAgent.start_link(%{})

      assert UserAgent.save(user) == :ok
    end
  end

  describe "get/1" do
    setup do
      UserAgent.start_link(%{})

      :ok
    end

    test "when the user if found, returns the user" do
      :user |> build(cpf: "123456") |> UserAgent.save()

      response = UserAgent.get("123456")

      expected_response =
        {:ok,
         %Exlivery.Users.User{
           address: "Rua teste",
           age: 20,
           cpf: "123456",
           email: "teste@email.com",
           name: "Joao"
         }}

      assert response == expected_response
    end

    test "when the user if not found, returns an error" do
      response = UserAgent.get("00000000")

      expected_response = {:error, "User not found"}

      assert response == expected_response
    end
  end
end
