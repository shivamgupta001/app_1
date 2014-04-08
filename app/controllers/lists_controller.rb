class ListsController < ApplicationController
        def index
          @lists=current_user.lists
       	end       
        def new
    	  @list = current_user.lists.build
        end
	    def create
          @list=current_user.lists.build(list_params)
           if @list.save
	        redirect_to lists_path
	       else
	        render :new
	       end
	    end
	    def edit

	      @list=List.where(:id=> params[:id] , :user_id=>current_user.id).first
	    end
		def show 
	 	 @list=List.where(:id=> params[:id] , :user_id=>current_user.id).first
		end
		def update
	 	 @list=List.where(:id=>params[:id] , :user_id=>current_user.id).first
	  	 if @list.update_attributes(list_params)
	   	    redirect_to lists_path
	   	 else
	       render :edit
	     end
	    end
	    def destroy
	 	 @list=List.where(:id=>params[:id] , :user_id=>current_user.id).first 
		  if @list.destroy
	       redirect_to lists_path
		  else
	       render :edit
	  	  end
      	end
        private
        def list_params
           params.require(:list).permit(:id , :name , :s_date , :e_date , :user_id)
        end
	  
end

