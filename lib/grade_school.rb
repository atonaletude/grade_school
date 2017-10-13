require 'pry'
class School
  attr_reader :names, :grades
  attr_accessor :students
  def initialize
    @students = {}
    @names = []
    @grades =[]
  end

  def to_h
    @students.values.map! do |value|
      value.sort!
    end
    Hash[@students.sort_by{|key, val| key}]
  end

  def grade(num)
    return [] unless @students.keys.include?(num)
    @students[num]
  end

  def add(name, grade)
    @names << name
    @grades << grade
    same_name = []
    @grades.zip(@names).each do |group|
      if @grades.count(group[0]) > 1
       @students[group[0]] = same_name << group[1]
     else
       @students[group[0]] = [group[1]]
     end
      # binding.pry
    end
  end
end
school = School.new

[
      ['Jennifer', 4], ['Kareem', 6],
      ['Christopher', 4], ['Kyle', 3]
    ].each do |name, grade|
      school.add(name, grade)
    end
p school.to_h
