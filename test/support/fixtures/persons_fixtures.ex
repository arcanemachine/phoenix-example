defmodule PhxNew16.PersonsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `PhxNew16.Persons` context.
  """

  @doc """
  Generate a person.
  """
  def person_fixture(attrs \\ %{}) do
    {:ok, person} =
      attrs
      |> Enum.into(%{
        age: 42,
        name: "some name"
      })
      |> PhxNew16.Persons.create_person()

    person
  end
end
