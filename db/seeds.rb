# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Comment.delete_all
Post.delete_all
Category.delete_all

Category.create!(title: "General", slug: "general")
Category.create!(title: "Rails", slug: "rails")
Category.create!(title: "Travel", slug: "travel")
Category.create!(title: "Coffee", slug: "coffee")

Category.all.each do |category|
  (1..10).each do |i_post|
    post =
      category.posts.create!(
        title: "Post #{i_post}",
        content: "Post #{i_post} content...",
        slug: "post-#{i_post}",
        published: true,
        published_at: (1000 - i_post).minutes.ago
      )
    (1..10).each do |i_comment|
      post.comments.create!(
        name: "Visitor",
        content: "Comment #{i_comment} content",
        approved: true)
    end
  end
  (11..13).each do |i_post|
    post =
      category.posts.create!(
        title: "Unpublished Post #{i_post}",
        content: "Unpublished Post #{i_post} content...",
        slug: "post-#{i_post}",
        published: false
      )
  end
end
