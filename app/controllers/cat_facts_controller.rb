class CatFactsController < ApplicationController
  def index
    @cat_fact = CatFact.new
    @cat_facts = CatFact.all
  end

  def create
    @cat_fact = CatFact.new
    @cat_fact.fact = params[:cat_fact][:fact]
    @cat_fact.save

    redirect_to cat_facts_path
  end
end
