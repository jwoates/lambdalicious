module App
  class Handler
    def self.process(event:, context:)
      puts event
      puts context
      "Hello World!"
    end
  end
end
