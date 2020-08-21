class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: :home
  skip_before_action :authenticate_user #test
  end
end
