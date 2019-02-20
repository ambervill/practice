# Implement the Attributes module in plain ruby

module Attributes
  def attributes
    attributes = self.class.attributes
    attributes.inject({}){|memo, attribute| memo[attribute] = self.send(attribute); memo}
  end
  def self.included(base)
    base.singleton_class.instance_eval do
      attr_accessor :attributes
    end
    base.attributes = []
    base.extend(ClassMethods)
  end
  module ClassMethods
    def attribute(attr_name, default = {})
      attributes << attr_name
      define_method attr_name do
        ret = instance_variable_get :"@#{attr_name}"
        ret || default[:default]
      end
      attr_writer attr_name
    end
  end
end

class Login
  include Attributes

  attribute :email
  attribute :password
  attribute :remember_me, :default => true
  attribute :remember_me2, :default => false
end

login = Login.new
login.email = "me@example.org"
login.password = "mypassword"
login.remember_me = true

puts login.email         # => "me@example.org"
puts login.password      # => "mypassword"
puts login.remember_me   # => true
puts login.remember_me2   # => false

puts login.attributes    # => { email: "me@example.org", password: "mypassword", remember_me: true }

