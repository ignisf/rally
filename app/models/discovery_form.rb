class DiscoveryForm
  include ActiveModel::Model
  attr_accessor :treasure, :answer

  validate :ensure_answer_is_correct

  private

  def ensure_answer_is_correct
    return if treasure.answer.strip.downcase == answer.strip.downcase

    errors.add(:answer, "is not correct")
  end
end
