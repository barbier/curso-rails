module PostsHelper
  def post_meta post
    "Created by #{ post.account.first_name } #{time_ago_in_words(post.created_at)} ago within #{post.category.title}. (#{post.views} views)"
  end
end
