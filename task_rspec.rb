require 'rspec'
require_relative 'task'

#Story: As a developer, I can create a Task.
describe Task do
  it "Task object can be created" do
  expect{Task.new}.to_not raise_error
end

#Story: As a developer, I can give a Task a title and retrieve it.
  it "We can give the Task a name" do
    task1 = Task.new("eggs")
    expect(task1.task_name).to_not eql ""
    expect(task1.task_name).to be_a String
  end
#Story: As a developer, I can give a Task a description and retrieve it.
  it "We can give the Task a description" do
    task1 = Task.new("eggs", "scramble the eggs")
    expect(task1.task_desc).to_not eql ""
    expect(task1.task_desc).to be_a String
  end
#Story: As a developer, I can mark a Task done.
  it "Task is completed" do
    task1 = Task.new
    expect(task1.completed).to eq true
  end
#Story: As a developer, when I print a Task that is done, its status is shown.
  it "Completion status is shown" do
    task1 = Task.new
    task1.completed
    expect(task1.status).to eql "It is true that the task is completed"
  end
end
#Story: As a developer, I can add all of my Tasks to a TaskList.
#Hint: A TaskList has-many Tasks
describe TaskList do
  it "TaskList object can be created" do
    expect{TaskList.new}. to_not raise_error
  end

  it "Tasks are in the TaskList" do
    list1 = TaskList.new
    task1 = Task.new
    list1.addList(task1)
    expect(list1.list.length).to_not eql 0
  end

#Story: As a developer with a TaskList, I can get the completed items.
  it "These items are complete" do
    list1 = TaskList.new
    task1 = Task.new
    task2 = Task.new
    task3 = Task.new
    task1.completed
    task3.completed
    list1.addList(task1)
    list1.addList(task2)
    list1.addList(task3)
    expect(list1.completed_items).to contain_exactly(task1, task3)
  end
#Story: As a developer with a TaskList, I can get the incomplete items.
  it "These items are not complete" do
    list1 = TaskList.new
    task1 = Task.new
    task2 = Task.new
    task3 = Task.new
    task1.completed
    task3.completed
    list1.addList(task1)
    list1.addList(task2)
    list1.addList(task3)
    expect(list1.incomplete_items).to contain_exactly(task2)
  end
end
