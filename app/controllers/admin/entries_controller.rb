class Admin::EntriesController < Admin::AdminController
  before_filter :get_entry, only: [:show, :edit, :update, :destroy]
  def index
    @page = params[:page] || 1
    @entries = Entry.all
    @total = @entries.count
    @entries = @entries.page(@page)
  end

  def new
    @entry = Entry.new
  end

  def create
    @entry = Entry.new(entry_params)
    if @entry.save
      redirect_to admin_entries_path
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
      redirect_to admin_entries_path
    else
      flash[:danger] = @entry.errors
      render "edit"
    end
  end

  def destroy
  end

  private
  def get_entry
    @entry = Entry.find(params[:id])
  end

  def entry_params
    params.require(:entry).permit(:writing, :kana, :romaji, :definition_de, :definition_en, :definition_fr, :textbox_de, :textbox_en, :image)
  end
end
