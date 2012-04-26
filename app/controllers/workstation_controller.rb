class WorkstationController < ApplicationController
  before_filter :authenticate
  layout 'dashboard'

  def dashboard
  end

end
