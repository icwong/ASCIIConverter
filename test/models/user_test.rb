require 'test_helper'

class UserTest < ActiveSupport::TestCase
	self.use_instantiated_fixtures = true

  def setup
  	@user = users(:mobOne);
  	@preference = @user.build_preference(name: 'Mob One');
  end

  test "preference validation" do
  	assert @preference.valid?
  end

  test "preference association validation" do
  	@preference.user_id = nil
  	assert_not @preference.valid?
  end
end
