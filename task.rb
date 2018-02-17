class Task
  def initialize (name = "", desc = "", status = "")
    @name = name
    @desc = desc
    @complete = false
    @status = status
  end

  def task_name
    @name
  end

  def task_desc
    @desc
  end

  def complete
    @complete
  end

  def completed
    @complete = !@complete
  end

  def status
    @status = "It is #{@complete} that the task is completed"
  end

  def task_details
    @task_details = "#{@name}, #{@desc}, #{status}"
  end

end

class TaskList
  def initialize
    @list = []
    @completed_items = []
    @incomplete_items = []
    @items_due = []
    @sorted_incomplete = []
    @sorted_due_items = []
    @filter_due_items = []
    @sorted_due_list = []
  end

  #---------------------------Task_rspec class

  def list
    @list
  end

  def addList(task)
    @list << task
  end

  def completed_items
    @completed_items = @list.select{|element| element.complete == true}
  end

  def incomplete_items
    @incomplete_items = @list.select{|element| element.complete == false}
  end

  #----------------------------dueDate_rspec class

  def items_due
    @items_due = @list.select{|element| element.due_date != nil}
  end

  def due_today_incomplete
    @due_today_incomplete = @list.select{|element| element.due_date == "2.15.18" && element.complete == false}
  end

  def sorted_incomplete
    @sorted_incomplete = @incomplete_items.sort{|a, b| a.due_date.to_f <=> b.due_date.to_f}
  end

  def due_items
    @filter_due_items = @list.select{|element| element.class == DueDateTask}
  end

  def tasks
    @filter_tasks = @list.select{|element| element.class == Task}
  end

  def sorted_due_items
    @sorted_due_items = @filter_due_items.sort{|a, b| a.due_date.to_f <=> b.due_date.to_f}
  end

  def incomplete_due
    @incomplete_due =
    (@list.select{|element|
      element.complete == false &&
      element.class == DueDateTask}
      .sort{|a, b| a.due_date.to_f <=> b.due_date.to_f})
  end


end
#------------------------------Due Date Classes---------------------------------
class DueDateTask < Task
  attr_accessor :name

  def initialize(name, desc, due_date)
    super
    @name = name
    @desc = desc
    @status = status
    @due_date = due_date
  end

  def details
    task_details
  end

  def due_date
    @due_date
  end
end

class DueTaskList < TaskList
  def initialize
    super
  end

  def due_dates
    items_due
  end
end
#------------------------------Anniversary Classes-----------------------------
class Anniversary < DueDateTask

  def initialize(month, day, year = 2018, this_month, this_day, this_year)
    @month = month
    @day = day
    @year = year
    @this_month = this_month
    @this_day = this_day
    @this_year = this_year
    @anniversary_date = @month + @day + @year
    @todays_date = @this_month + @this_day + @this_year
  end

  def due_date
    if (@month < @this_month)
      "Your anniversary is #{@month}, #{@day}, #{@year += 1}"
    elsif (@month == @this_month && @day < @this_day)
      "Your anniversary is #{@month}, #{@day}, #{@year += 1}"
    elsif (@month == @this_month && @day == @this_day)
      "Your anniversary is today! Yay!"
    else "Your anniversary is #{@month}, #{@day}, #{@year}"
    end
  end

  def view
    "Month: #{@month}
    Day: #{@day}
    Year: #{@year}"
  end


end
