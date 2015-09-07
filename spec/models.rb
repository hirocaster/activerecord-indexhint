base = { "adapter" => "mysql2", "encoding" => "utf8", "pool" => 5, "username" => "root", "password" => "", "host" => "127.0.0.1" }

ActiveRecord::Base.configurations = {
  "test" => base.merge("database" => "test")
}

ActiveRecord::Base.establish_connection(:test)

class User < ActiveRecord::Base
end
