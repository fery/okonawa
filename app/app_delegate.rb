class AppDelegate
  def application(application, didFinishLaunchingWithOptions: launchOptions)
    seed unless RUBYMOTION_ENV == 'test'
    
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)

    @todos_controller = TodosController.alloc.initWithNibName(nil, bundle: nil)

    @window.rootViewController = UINavigationController.alloc.initWithRootViewController(@todos_controller)

    @window.makeKeyAndVisible 

    true
  end

  private

  def seed
    now = NSDate.new

    things = %w( Somethin AnotherThing LastThing).each do |thing|
      Todo.create :name        => thing,
                  :description => "We need #{thing}",
                  :due_date    => now              
    end
  end
end
