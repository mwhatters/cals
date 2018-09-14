module HomeHelper
  def threshold_class(calories: 0)
    threshold = ::Stats::BASELINE_CAL_COUNT

    return "bc__bad" if (threshold - calories).negative?
    return "bc__warning" if (threshold - calories) < 200
    return "bc__good"
  end
end
