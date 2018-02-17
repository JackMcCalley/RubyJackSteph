require 'rspec'

require_relative 'task'

# Story: As a developer, I can create a to do item for an anniversary (a yearly recurring event) .
# Hint: An Anniversary has a month and a day.
# Hint: An Anniversary is a special kind of DueDateTask where the due date changes depending on the current date (override the due_date method to return the next annivesary date).
describe Anniversary do
  it "anniversary object is real" do
  ann = Anniversary.new(1, 22, 2, 16, 2018)
  expect{ann}.to_not raise_error
  p ann.due_date
  end

# Story: As a developer, I can print an item for an anniversary with field labels and values.
  it "prints anniversary with field labels and values" do
    ann = Anniversary.new(1, 22, 3, 15, 2018)
    expect(ann.view).to be_a String
    p ann.view
  end
# Story: As a developer with a TaskList with and without due dates and yearly recurring dates, I can list all the not completed items in order of due date and yearly dates for the current month.

# Story: As a developer with a TaskList with a collection of items with and without due dates and yearly recurring dates, I can list all the not completed items in order of due date and yearly dates for the current month, then the items without due dates.

end
#comment
