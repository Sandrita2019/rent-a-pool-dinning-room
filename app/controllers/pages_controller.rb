class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: :home
  # skip_before_action :authenticate_user # test
  skip_before_filter :verify_authenticity_token
  skip_before_filter :authenticate_user!, :raise => false
  end
end
