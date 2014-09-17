class InternalComunicationController < ApplicationController
	########### coments in red lights ###########
    def create_comment
    	@comment = Comment.create(user_id: current_user.id, red_light_id: params[:to_red_light], content: params[:content] )
        if @comment.save
           @r = @comment.red_light
           puts "************>#{@r.help_institution}"
           @i = @r.help_institution
           puts "************>#{@i.id}"
           puts "************>#{@u.id}"
           @u = @i.user
           if current_user.id == @u.id
           @u_x = User.find(@r.adviser)
           @mail = InstitutionManagment.comment_to_problem( @u_x, @i, @r.id).deliver
           else
           @mail = InstitutionManagment.comment_to_problem( @u, @i, @r.id).deliver
           end
           puts @mail 
           @cf = true
        else
           @cf = false
        end
        respond_to do |format|
          format.js
        end
    end

    def delete_comment
        @comment = Comment.find(params[:id])
        @comment.destroy
    	respond_to do |format|
          format.js
        end
    end

    def edit_comment
        @comment = Comment.find(params[:id])
    	respond_to do |format|
          format.js
        end
    end

    def update_comment
    	@comment = Comment.update_attributes(params[:content])
    	respond_to do |format|
          format.js
        end
    end

    def clear_notices
      @user = current_user
      flash.clear
        respond_to do |format|
          format.js
        end
    end

end
