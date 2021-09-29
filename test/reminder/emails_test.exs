defmodule Reminder.EmailsTest do
  use Reminder.DataCase

  describe "emails" do
    test "welcome email" do
      email = Reminder.Emails.Email.welcome_html_email("person@example.com")
      assert email.subject == "Welcome!"
    end
  end
end

