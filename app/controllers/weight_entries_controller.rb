class WeightEntriesController < ApplicationController
  def create
    weight_entry = WeightEntry.new(weight_entry_params)
    weight_entry.save
    redirect_to root_path
  end

  private def weight_entry_params
    params.require(:weight_entry).permit(:weight)
  end
end
