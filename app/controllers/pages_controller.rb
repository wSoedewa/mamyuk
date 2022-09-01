class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def components
  end

  def search_1
  end

  def search_2
  end

  def search_3
  end

  def loading_results
  end
end
