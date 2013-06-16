require "course"

class Course
  LearnToCode = Course.new("learn_to_code") do
    lesson "learn_to_code"
    lesson "computers"
    lesson "objects"
    lesson "variables"
    lesson "the_command_line"
    lesson "input_and_output"
    lesson "logic"
    lesson "loops"
    lesson "arrays"
    lesson "iterators"
    lesson "functions"
    lesson "sinatra"
  end
end
