class BlocCastController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :search]

  def index
  end

  def show
  end

  def search
  end
end
