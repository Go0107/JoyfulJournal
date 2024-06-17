class Journal < ApplicationRecord
  belongs_to :user

  def happiness_score
    case stamp
    when 'fine' then 5
    when 'good' then 4
    when 'neutral' then 3
    when 'unhappy' then 2
    when 'depressed' then 1
    else 0
    end
  end
end
