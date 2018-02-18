require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @fake_show_list = [{"genre_ids":[80, 18]}, {"genre_ids":[18, 12, 28]}, {"genre_ids":[18, 12, 9648]}]
    @fake_show_list.each {|obj| obj.stringify_keys! }

    @user = User.new(email: "test@bloccast.tv", password: "teateatea", password_confirmation: "teateatea")
    @user.skip_confirmation!
    @user.save
  end

  test "should create user" do
    assert_instance_of User, @user
    assert_equal @user.email, "test@bloccast.tv"
    assert_equal @user.password, "teateatea"
    assert_nil @user.searched_genres
  end

  test "should create searched_genres when searched_genres is nil" do
    assert_nil @user.searched_genres

    @user.update_genre_list(@fake_show_list)
    assert_equal @user.searched_genres, {"80"=>1, "18"=>3, "12"=>2, "28"=>1, "9648"=>1}
  end

  test "should update searched_genres multiple times" do
    assert_nil @user.searched_genres

    @user.update_genre_list(@fake_show_list)
    assert_equal @user.searched_genres, {"80"=>1, "18"=>3, "12"=>2, "28"=>1, "9648"=>1}

    @user.update_genre_list(@fake_show_list)
    assert_equal @user.searched_genres, {"80"=>1.8, "18"=>5.5, "12"=>3.7, "28"=>1.8, "9648"=>1.8}
  end

  test "that most_searched_genres fails gracefully" do
    assert_equal @user.most_searched_genres, ""
  end

  test "that most_searched_genres returns string of most searched genre ids" do
    @user.update_genre_list(@fake_show_list)
    assert_equal @user.most_searched_genres, "18,12,80"
  end
end
