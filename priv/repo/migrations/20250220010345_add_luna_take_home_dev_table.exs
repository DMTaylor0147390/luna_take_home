defmodule LunaTakeHome.Repo.Migrations.AddLunaTakeHomeDevTable do
  use Ecto.Migration

  def change do
    create table("luna_take_home_dev") do
      add :foo, :string
      add :bar, :string

      timestamps()
    end
  end
end
