class PostValidator < ActiveModel::Validator
  CLICKBAIT_PATTERNS = [
    /Won't Believe/i,
    /Secret/i,
    /Top [0-9]*/i,
    /Guess/i
  ]
  
  def validate(record)
    # binding.pry
    if !!record.title

      unless ["Won't Believe", "Secret", "Top", "Guess"].any? {|i| record.title.downcase.include?(i.downcase)}
        record.errors[:title].push("is not sufficiently clickbait-y")
      end

      # unless CLICKBAIT_PATTERNS.any? {|i| record.title.match(i)}
      #   record.errors.add(:title, "is not sufficiently clickbait-y")
      # end

    end
  end
end