describe TodoController do 
  tests TodoController

  before do
    @now = NSDate.new

    @todo = Todo.create :name        => 'A name',
                        :description => 'A description',
                        :due_date    => @now

    @controller = TodoController.new(@todo)
    @form = @controller.instance_variable_get("@form") 
    @name_row = @form.sections[0].rows[0]
    @details_row = @form.sections[0].rows[1]
    @due_date_row = @form.sections[0].rows[2]
    @done_row = @form.sections[0].rows[3]    
  end

  it 'displays a todo list' do
    @name_row.value.should.equal 'Something'
    @details_row.value.should.equal 'We need Something'
    @due_date_row.object.date_value.hour.should.equal @now.hour
    @due_date_row.object.date_value.min.should.equal @now.min
    @done_row.value.should.equal false
  end

  it 'saves changes to the ToDo' do
    @name_row.object.row.value = 'New value'
    controller.save

    saved_todo = Todo.find(@todo.id)

    saved_todo.name.should.equal 'New value'
  end
end