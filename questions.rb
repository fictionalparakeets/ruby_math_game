class Questions
  def initialize
    @nums = Array(1..50)
  end

  def give_question
    first_num = @nums.sample
    second_num = @nums.sample

    output = "What is #{first_num} + #{second_num}?"
    answer = first_num + second_num
    [output, answer]
  end
end
