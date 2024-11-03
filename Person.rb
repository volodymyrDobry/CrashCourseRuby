require 'date'

class Person
  attr_reader :name, :surname, :date_of_birth

  def initialize(name, surname, date_of_birth)
    @name = name
    @surname = surname
    @date_of_birth = validate_date_of_birth(date_of_birth)
  end

  def to_s
    "#{name} #{surname}, born on #{date_of_birth}"
  end

  def <=>(other)
    return nil unless other.is_a?(Person)
    [@name, @surname, @date_of_birth] <=> [other.name, other.surname, other.date_of_birth]
  end

  def ==(other)
    return false unless other.is_a?(Person)
    @name == other.name && @surname == other.surname && @date_of_birth == other.date_of_birth
  end

  private

  def validate_date_of_birth(date_of_birth)
    parsed_date = Date.parse(date_of_birth)
    raise ArgumentError, "Date of birth must not be in the future" if parsed_date > Date.today
    parsed_date
  rescue ArgumentError
    raise ArgumentError, "Invalid date of birth"
  end

  def calculate_age
    today = Date.today
    age = today.year - @date_of_birth.year
    age -= 1 if today.day > @date_of_birth.day and today.month > @date_of_birth.month
    age
  end
end

class StudentPerson < Person
  @@students = []

  def initialize(name, surname, date_of_birth)
    super(name, surname, date_of_birth)
    self.class.add_student(self)
  end

  def self.students
    @@students
  end

  def self.check_student_in_the_list(student)
    @@students.include?(student)
  end

  def self.add_student(student)
    @@students << student unless check_student_in_the_list(student)
  end

  def self.remove_student(student)
    @@students.delete(student) if check_student_in_the_list(student)
  end

   def calculate_age
    super
  end

  def self.get_student_by_age(age)
    @@students.select do |student|
      student.calculate_age == age
    end
  end

  def self.get_student_by_name(name)
    @@students.select do |student|
      student.name == name
    end
  end
end
