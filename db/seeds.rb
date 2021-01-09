5.times do 
  Category.create({
    name: Faker::Book.title
  })
end