require "administrate/field/base"

class DurationField < Administrate::Field::Base
  def to_s
    if data
      data.inspect
    else
      'N/A'
    end
  end
end
