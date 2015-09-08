class Admin::ReferencesController < Admin::AdminController
  before_filter :get_entry

  def index
    @icons = Icon.all
    @new_reference = Reference.new
    @references = @entry.references
  end

  def create
    @new_reference = @entry.references.new(reference_params)
    if @new_reference.save
      flash[:success] = "Referenz wurde hinzugefügt!"
    else
      flash[:danger] = @new_reference.errors.full_messages.join "\n"
    end
    redirect_to admin_entry_references_path(@entry)
  end

  def destroy
    reference = @entry.references.find(params[:id])
    if reference.destroy
      flash[:success] = "Referenz wurde gelöscht!"
    else
      flash[:danger] = reference.errors.full_messages.join "\n"
    end
    redirect_to admin_entry_references_path(@entry)
  end

  private
  def get_entry
    @entry = Entry.find(params[:entry_id])
  end
  def reference_params
    params.require(:reference).permit(:name, :url, :icon_id)
  end
end
