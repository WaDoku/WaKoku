class SearchController < ApplicationController
  def index
    @page = params[:page] || 1
    @results = params[:search] && params[:search].strip != "" ? Entry.where("writing LIKE :writing OR kana LIKE :kana OR romaji LIKE :romaji OR definition_de LIKE :def_de OR definition_en LIKE :def_en OR definition_fr LIKE :def_fr", search_params(params[:search])) : Entry.where(id: nil)
    @total = @results.count
    @entries = @results.page(@page)
  end

  private
  #bring the search parameter into the right format
  #i.e. %?% for LIKE
  def search_params search
    search = Hash.new
    [:writing, :kana, :romaji, :def_de, :def_en, :def_fr].each do |field|
      search[field] = "%#{params[:search]}%"
    end
    search
  end
end
