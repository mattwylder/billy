class HomeController < ApplicationController
  def construction
      @billythought = current_user.billythoughts.build if logged_in?
      @billythoughts = Billythought.all
  end
end
