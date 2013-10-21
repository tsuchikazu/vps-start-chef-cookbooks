name "app"
run_list %w(
  recipe[user]  
  recipe[site_user]  
  recipe[sudo] 
  recipe[openssh] 
  recipe[simple_iptables] 
  recipe[site_simple_iptables] 
)
default_attributes(
  "authorization" => {
    "sudo" => {
      "users"        => ["tsuchikazu"],   
      "passwordless" => "true"
    }
  }, 
  "openssh" => {
    "server" => {
      "permit_root_login"       => "no", 
      "password_authentication" => "no"
    }
  }
)
