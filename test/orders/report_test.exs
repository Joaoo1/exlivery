defmodule Exlivery.Orders.ReportTest do
  use ExUnit.Case

  import Exlivery.Factory

  alias Exlivery.Orders.Agent, as: OrderAgent
  alias Exlivery.Orders.Report

  describe "create/1" do
    test "creates the report file" do
      OrderAgent.start_link(%{})

      :order
      |> build()
      |> OrderAgent.save()

      :order
      |> build()
      |> OrderAgent.save()

      expected_response =
        "12312312300,pizza,1,35.5japonesa,1,35.5,71.00\n" <>
          "12312312300,pizza,1,35.5japonesa,1,35.5,71.00\n"

      Report.create("report_test.csv")

      response = File.read!("report_test.csv")

      assert response == expected_response
    end
  end
end
