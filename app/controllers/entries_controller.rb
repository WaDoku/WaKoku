class EntriesController < ApplicationController
  def index
    @entries = Entry.all
    @more = true
    @total = 10
    @offset = 1
    @query = "a"
  end
end
