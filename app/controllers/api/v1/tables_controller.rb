class Api::V1::TablesController < Api::V1::BaseController
  def index
    @tables = policy_scope(Table).order(:position)
  end
end
