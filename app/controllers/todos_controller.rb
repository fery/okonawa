class TodosController < UIViewController
  attr_writer :data

  def viewDidLoad
    super

    self.title = 'Okonawa'
    @table = UITableView.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @table.dataSource = self

    self.view.addSubview(@table)

    @data = %w(Something anotherThing lastThing).map { |t| "Buy #{t}"}
  end

  def tableView(tableView, numberOfRowsInSection: section)
    @data.size
  end

  def tableView(tableView, cellForRowAtIndexPath: indexPath)
    cell = UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier: nil)

    cell.textLabel.text = @data[indexPath.row]
    cell    
  end
end