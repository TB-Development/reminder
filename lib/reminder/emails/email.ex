defmodule Reminder.Emails.Email do
  use Bamboo.Phoenix, view: ReminderWeb.EmailView

  def welcome_text_email(email_address) do
    new_email()
    |> to(email_address)
    |> from("tblevins102897@gmail.com")
    |> subject("Welcome!")
    |> put_text_layout({ReminderWeb.LayoutView, "email.text"})
    |> render("welcome.text")
  end

  def welcome_html_email(email_address) do
    email_address
    |> welcome_text_email()
    |> put_html_layout({ReminderWeb.LayoutView, "email.html"})
    |> render("welcome.html")
  end
end


