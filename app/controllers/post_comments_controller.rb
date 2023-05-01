class PostCommentsController < ApplicationController

  def create
    post_image = PostImage.find(params[:post_image_id])
    comment = current_user.post_comments.new(post_comment_params)
    #空のインスタンスの作成とログイン中のユーザーIDを代入している
    comment.post_image_id = post_image.id
    #投稿した画像のidを代入している
    comment.save
    #コメントを作成しdbに登録している
    redirect_to post_image_path(post_image)
  end

  def destroy
    PostComment.find(params[:id]).destroy
    redirect_to post_image_path(params[:post_image_id])
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end
