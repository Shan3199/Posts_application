# README

First github change repo.  Hi this shantanu 

git init
git remote
git clone
git status
git log
git branch
git add
git commit
git push
git push/pop/fetch
git rebase



remote: true (async request)

<!-- 
[remote "origin"]
	url = https://github.com/Shan3199/blog.git
	fetch = +refs/heads/*:refs/remotes/origin/*

	url = git@github.com:Shan3199/blog.git -->

	 // $("#items_grid").html("<%= j render 'post_likes', locals: {post: @post}'%>");

	// $('#items_grid').html("<%= j render 'posts/post_likes', locals: {post: @post}%>");



	
<!-- <br><br>
<div class="d-flex justify-content-center">
  <%@comment.each do |comment| %>        
  <div class="card" style="width: 18rem;">
    <div class="card-body">
      <h5 class="card-title"><%#= comment.user.email %></h5>
      <p class="card-text"><%#= comment.text %>.</p>
      <% if comment.author?(current_user)%>
      <%= link_to 'Edit!',  edit_post_comment_path(comment.post, comment),class:"btn btn-outline-info"%>
      <%= link_to 'Delete',  post_comment_path(comment.post, comment),  method: :delete,data: { confirm: "Are you sure?" },class:"btn btn-outline-danger"%>
      <%= link_to 'View likes', comment_likes_path(comment), class:"btn btn-outline-info"%>

      <%end%>

      <% if !comment.author?(current_user)%>
      <% if comment.comment_user_like(current_user.id)%>
      <% pre_like = comment.comment_user_like(current_user.id) %>
      <%= link_to  (comment.likes.count)==0 ? 'NoLike!' : "Liked #{comment.likes.count}",comment_like_path(comment.id, pre_like.id),method: :delete, class:"btn btn-block btn-primary fa fa-thumbs-up"%>  
      <%else%>
      <%= link_to  (comment.likes.count)==0 ? 'NoLike!' : "Likes #{comment.likes.count}",comment_likes_path(comment.id),method: :post, class:"btn btn-block btn-primary fa fa-thumbs-up"%>
      <%end%>
      <%end%>
    </div>
  </div>
  <%end%>
</div>
-->
