module GroupOn
  class WelcomeController < ::WelcomeController
    def index
      puts "GROUP ON WELCOME CONTROLLER"
    end

    def wtf
      render text: "WTF"
    end
  end
end
