class School
  attr_reader :name, :groups, :courses

  def initialize(name, groups)
    @name = name
    @groups = groups
    @courses = []
  end

  def add_course(course)
    @courses << course
  end

  def assign_to_group(student)
    student.group = @groups.sample
  end

  def group_all_students
    @courses.each do |course|
      course.students.each do |student|
        student.group = @groups.sample
      end
    end
  end

  def names
    @courses.map do |course|
      course.students.map do |student|
        student.name
      end
    end.flatten.uniq
  end

  def students_by_group
    grouped_students = {}
    @groups.each do |group|
      students = []
      @courses.each do |course|
        students << course.students.find_all{|student| student.group == group}
      end
      grouped_students[group] = students.flatten.uniq
    end
    grouped_students
  end
end
