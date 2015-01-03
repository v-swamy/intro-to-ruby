class Student
  attr_accessor :name

  def initialize(name, grade)
    @name = name
    @grade = grade
  end

  def get_grade
    grade
  end

  def better_grade_than?(student)
    self.get_grade < student.get_grade
  end

  private

  def grade
    @grade
  end
end

joe = Student.new("Joe", 'A')
john = Student.new("John", 'C')

puts "Well done!" if joe.better_grade_than?(john)
