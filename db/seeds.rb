# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


DatabaseCleaner.strategy = :truncation

DatabaseCleaner.clean # cleanup of the test

10.times do
  Meal.create(
    name: Faker::Food.dish,
    description: Faker::Lorem.sentence
  )
end


 5.times do |index|
   order_id = "GO#{120 + index.to_i}"
   DeliveryOrder.create(
     order_id: order_id,
     serving_datetime: Time.now
   )
   rand(1..5).times do
    OrderItem.create(
      quantity: rand(1..20),
      unit_price: rand(20..100),
      delivery_order_id: index + 1,
      meal_id: rand(1..10)
    )
    end
 end
