class Admin::EntriesController < Admin::AdminController
  before_filter :get_entry, only: [:edit, :update, :destroy]
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
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def get_entry
    @entry = Entry.find(params[:id])
  end
end
