# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     RedPotion.Repo.insert!(%RedPotion.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

RedPotion.Repo.insert!(%RedPotion.Artifacts.Counter{name: "Bugs per sprint"})
RedPotion.Repo.insert!(%RedPotion.Artifacts.Counter{name: "Rejections per sprint"})
