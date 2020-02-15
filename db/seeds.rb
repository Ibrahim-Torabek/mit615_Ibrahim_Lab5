# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

for i in 1..50
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  name = "#{first_name} #{last_name}"
  email = Faker::Internet.safe_email(name: name)

  user = User.new
  user.email = email
  user.name = name
  if user.save
    p "Saved user ##{i}: #{name} (#{email})"
    article = Article.new
    article.user = user
    article.title = Faker::Lorem.sentence
    article.content = Faker::Lorem.paragraph
    
    article.save

    for ii in 1..10
      comment = Comment.new
      comment.user = user
      comment.message = Faker::Lorem.paragraph
      comment.article = article
      if comment.save
        p "Comment ##{ii} saved for #{name}"
      else
        p comment.errors
      end
      #article.comment = comment


    end
  else
    p user.errors
  end
end

