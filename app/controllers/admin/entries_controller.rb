class Admin::EntriesController < Admin::AdminController
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
end
