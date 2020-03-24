# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

cat_1 = Cat.create!(birth_date: '01/01/2001', color: 'black', name: 'Fred', sex: 'M', description: 'This is a black cat')

# create_table "cats", force: :cascade do |t|
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#     t.date "birth_date", null: false
#     t.string "color", null: false
#     t.string "name", null: false
#     t.string "sex", limit: 1, null: false
#     t.text "description", null: false
#   end

#    CAT_COLORS = [
#         "black", 
#         "brown", 
#         "orange", 
#         "gray"
#     ]