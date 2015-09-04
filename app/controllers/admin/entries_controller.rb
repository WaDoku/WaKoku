class Admin::EntriesController < Admin::AdminController
  before_filter :get_entry, only: [:show, :edit, :update, :destroy, :delete_image]
  def index
    @page = params[:page] || 1
    @entries = params[:search] ? Entry.where("writing = :writing OR kana = :kana OR romaji = :romaji OR definition_de LIKE :def_de OR definition_en LIKE :def_en OR definition_fr LIKE :def_fr", search_params(params[:search])) : Entry.all
    @total = @entries.count
    @entries = @entries.page(@page)
  end

  def new
    @entry = Entry.new
  end

  def create
    @entry = Entry.new(entry_params)
    if @entry.save
      flash[:success] = "Eintrag wurde erfolgreich erstellt!"
      redirect_to admin_entry_path(@entry)
    else
      flash[:danger] = @entry.errors
      render "new"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @entry.update(entry_params)
      flash[:success] = "Eintrag wurde geändert!"
      redirect_to admin_entry_path(@entry)
    else
      flash[:danger] = @entry.errors.full_messages.join "\n"
      render "edit"
    end
  end

  def destroy
    if @entry.destroy
      flash[:success] = "Eintrag wurde gelöscht!"
      redirect_to admin_entries_path
    end
  end

  def delete_image
    @entry.image = nil
    @entry.save
    redirect_to edit_admin_entry_path(@entry)
  end

  private
  def get_entry
    @entry = Entry.find(params[:id])
  end

  def entry_params
    #blank attributes should not be saved
    params.require(:entry).permit(:writing, :kana, :romaji, :definition_de, :definition_en, :definition_fr, :textbox_de, :textbox_en, :image).delete_if {|k,v| v.blank?}
  end

  #bring the search parameter into the right format
  #i.e. %?% for LIKE
  def search_params search
    search = Hash.new
    [:writing, :kana, :romaji].each do |field|
      search[field] = params[:search]
    end
    [:def_de, :def_en, :def_fr].each do |field|
      search[field] = "%#{params[:search]}%"
    end
    search
  end
end
