defmodule AshPostgres.TestRepo.Migrations.MigrateResources6 do
  @moduledoc """
  Updates resources based on their most recent snapshots.

  This file was autogenerated with `mix ash_postgres.generate_migrations`
  """

  use Ecto.Migration

  def up do
    alter table(:posts) do
      add :author_id,
          references(:authors,
            column: :id,
            name: "posts_author_id_fkey",
            type: :uuid,
            prefix: "public"
          )
    end
  end

  def down do
    drop constraint(:posts, "posts_author_id_fkey")

    alter table(:posts) do
      remove :author_id
    end
  end
end