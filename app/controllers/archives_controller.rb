class ArchivesController < ApplicationController
    # GET /messages or /messages.json
    def index
        @product_ids = current_user.products.ids
        @archives =  Archive.all.where(archive: true, product_id: @product_ids)
        #arc = Archive.all.where(archive: true)
    end

    def new
        @archive = Archive.new
    end

    def edit
        @archive = Archive.find(params[:id])
    end
  
  
    def create
            archive_params = params.require(:archive).permit(:archive,:product_id)
            @archive = Archive.new(archive_params)
            @archive.product_id = session[:product_id]
            
            if @archive.product_id == session[:product_id]
                @archive.archive = true
                @archive.update(archive_params)
                #@archive.save
                session.delete('product_id')
                redirect_to archives_path, notice: "produit archivé"
            else
                @archive.archive = true
                @archive.save
                session.delete('product_id')
                redirect_to archives_path, notice: "produit archivé"
            end
    end

    def update
        
        archive_params = params.require(:archive).permit(:archive, :product_id)
        @archive = Archive.find(params[:id])
        #@archive.product_id = session[:product_id]
        if @archive.update(archive_params)
            redirect_to  archives_path, notice: "produit désarchivé"
        else
            render :edit
        end
    end

    def destroy
        Archive.delete_all
        flash[:danger]=t("message.flash.danger")
        redirect_to archives_path
      end

end
  
