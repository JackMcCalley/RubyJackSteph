require 'rspec'
require_relative 'task'

# Story: As a developer, I can create a DueDateTask, which is-a Task that has-a due date.
# Hint: Use the built-in Ruby Date class
  describe DueDateTask do
    it "DueDateTask is a real Task object" do
      due_date1 = DueDateTask.new("task", "taskdesc", "2.22.22")
      expect{due_date1}.to_not raise_error
      expect(due_date1.name).to eq("task")
    end
# Story: As a developer, I can print an item with a due date with labels and values.
# Hint: When implementing to_s, use super to call to_s on the super class.
  it "DueDateTask prints out details" do
    due_date1 = DueDateTask.new("task", "taskdesc", "2.22.22")
    due_date1.completed
    expect(due_date1.details).to be_a String
    expect(due_date1.details).to eq "task, taskdesc, It is true that the task is completed"
  end
# Story: As a developer, I can add items with due dates to my TaskList.
# Hint: Consider keeping items with due dates separate from the other items.
  it "Adds items with due dates to the TaskList" do
  list1 = TaskList.new
  due_date1 = DueDateTask.new("task", "taskdesc", "2.22.22")
  due_date2 = DueDateTask.new("task", "taskdesc", "3.3.33")
  due_date3 = DueDateTask.new("task", "taskdesc", "2.15.18")
  list1.addList(due_date1)
  list1.addList(due_date2)
  list1.addList(due_date3)
  expect(list1.items_due.length).to eq(3)
end
# Story: As a developer with a TaskList, I can list all the not completed items that are due today.
it "Adds items with not completed that are due today" do
list1 = TaskList.new
due_date1 = DueDateTask.new("task", "taskdesc", "2.22.22")
due_date2 = DueDateTask.new("task", "taskdesc", "2.15.18")
due_date3 = DueDateTask.new("task", "taskdesc", "2.15.18")
due_date2.completed
list1.addList(due_date1)
list1.addList(due_date2)
list1.addList(due_date3)
expect(list1.due_today_incomplete.length).to eq(1)
end
# Story: As a developer with a TaskList, I can list all the not completed items in order of due date.
  it "Adds incomplete items in order of due date" do
    list1 = TaskList.new
    due_date1 = DueDateTask.new("task", "taskdesc", "2.22")
    due_date2 = DueDateTask.new("task", "taskdesc", "2.15")
    due_date3 = DueDateTask.new("task", "taskdesc", "2.18")
    due_date4 = DueDateTask.new("task", "taskdesc", "3.06")
    due_date5 = DueDateTask.new("task", "taskdesc", "2.19")
    due_date6 = DueDateTask.new("task", "taskdesc", "2.15")
    due_date2.completed
    due_date5.completed
    list1.addList(due_date1)
    list1.addList(due_date2)
    list1.addList(due_date3)
    list1.addList(due_date4)
    list1.addList(due_date5)
    list1.addList(due_date6)
    list1.incomplete_items
    expect(list1.sorted_incomplete).to start_with(due_date6).and end_with(due_date4)
    expect(list1.sorted_incomplete.length).to_not be(0)
    expect(list1.sorted_incomplete.length).to be(4)
  end
# Story: As a developer with a TaskList with and without due dates, I can list all the not completed items in order of due date, and then the items without due dates.
  it "accepts due date tasks and regular tasks" do
    list1 = TaskList.new
    due_date1 = DueDateTask.new("due1", "taskdesc1", "3.17")
    due_date2 = DueDateTask.new("due2", "taskdesc2", "4.13")
    due_date4 = DueDateTask.new("due3", "taskdesc3", "5.22")
    due_date3 = DueDateTask.new("due4", "taskdesc4", "3.15")
    task1 = Task.new("task1", "taskdesc")
    task2 = Task.new("task2", "taskdesc")
    task3 = Task.new("task3", "taskdesc")
    task4 = Task.new("task4", "taskdesc")
    due_date2.completed
    task4.completed
    #adding itmes to the list
    list1.addList(due_date1)
    list1.addList(task1)
    list1.addList(task2)
    list1.addList(task3)
    list1.addList(task4)
    list1.addList(due_date2)
    list1.addList(due_date3)
    list1.addList(due_date4)
    #creating temp lists
    due_list = []
    task_list = []
    #adding filtered/sorted items to temp lists
    (task_list << list1.filter_tasks).flatten!
    (due_list << list1.incomplete_due).flatten!
    expect(due_list.length).to eq(3)
    #concatenating complete list
    final_list = (due_list << task_list).flatten!
    expect(final_list.length).to eq(7)
    p final_list
    #TODO ADD THE REGULAR TASKS BACK INTO THE ARRAY
  end
end
#comment1
