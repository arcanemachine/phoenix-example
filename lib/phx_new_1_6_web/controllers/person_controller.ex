defmodule PhxNew16Web.PersonController do
  use PhxNew16Web, :controller

  alias PhxNew16.Persons
  alias PhxNew16.Persons.Person

  action_fallback PhxNew16Web.FallbackController

  def index(conn, _params) do
    persons = Persons.list_persons()
    render(conn, "index.json", persons: persons)
  end

  def create(conn, %{"person" => person_params}) do
    with {:ok, %Person{} = person} <- Persons.create_person(person_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.person_path(conn, :show, person))
      |> render("show.json", person: person)
    end
  end

  def show(conn, %{"id" => id}) do
    person = Persons.get_person!(id)
    render(conn, "show.json", person: person)
  end

  def update(conn, %{"id" => id, "person" => person_params}) do
    person = Persons.get_person!(id)

    with {:ok, %Person{} = person} <- Persons.update_person(person, person_params) do
      render(conn, "show.json", person: person)
    end
  end

  def delete(conn, %{"id" => id}) do
    person = Persons.get_person!(id)

    with {:ok, %Person{}} <- Persons.delete_person(person) do
      send_resp(conn, :no_content, "")
    end
  end
end
