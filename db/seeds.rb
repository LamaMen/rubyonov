# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

User.delete_all
User.reset_pk_sequence

Theme.delete_all
Theme.reset_pk_sequence
Theme.create([
  {name: "Honor"},
  {name: "Huawei"},
  {name: "Oppo"},
  {name: "Poco"},
  {name: "Vivo"},
])

Image.delete_all
Image.reset_pk_sequence
Image.create([
  {name: 'Honor 8X', file: 'honor_8x.jpg', theme_id: 1},
  {name: 'Honor Magic v2', file: 'honor_magic_v2.jpg', theme_id: 1},
  {name: 'Honor X7', file: 'honor_x7.jpg', theme_id: 1},
  {name: 'Honor X8B', file: 'honor_x8b.jpg', theme_id: 1},
  {name: 'Huawei Nova Y61', file: 'huawei_nova_y61.jpg', theme_id: 2},
  {name: 'Oppo A78', file: 'oppo_a78.jpg', theme_id: 3},
  {name: 'Oppo Find X7', file: 'oppo_find_x7.jpg', theme_id: 3},
  {name: 'Oppo Reno 11F', file: 'oppo_reno_11f.jpg', theme_id: 3},
  {name: 'Poco M6 Pro', file: 'poco_m6_pro.jpg', theme_id: 4},
  {name: 'Poco X6', file: 'poco_x6.jpg', theme_id: 4},
  {name: 'Vivo V30 Lite', file: 'vivo_v30_lite.jpg', theme_id: 5}
])