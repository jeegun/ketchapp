require 'test_helper'

class KetchupMailerTest < ActionMailer::TestCase
  test "confirm_ketchup_creator" do
    mail = KetchupMailer.confirm_ketchup_creator
    assert_equal "Confirm ketchup creator", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "confirm_ketchup_receiver" do
    mail = KetchupMailer.confirm_ketchup_receiver
    assert_equal "Confirm ketchup receiver", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
