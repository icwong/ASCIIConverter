require 'test_helper'

class PostTest < ActiveSupport::TestCase
	self.use_instantiated_fixtures = true

  def setup
  	@post = posts(:one);
  end

  test "post association validation" do
  	@post.owner = nil
  	assert_not @post.valid?
  end
end
