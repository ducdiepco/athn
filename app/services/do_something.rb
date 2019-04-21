class DoSomething
  attr_reader :params

  def initialize(params)
    @params = params
  end

  def self.call(*args)
    new(*args).call
  end

  def call
    puts 'do something'
  end
end
