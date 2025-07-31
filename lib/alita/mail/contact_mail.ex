# lib/mon_app/mails/contact_mail.ex
defmodule Alita.Mail.ContactMail do
  import Swoosh.Email

  def contact_email(%{
        nom: nom,
        email: email,
        objet: objet,
        message: message,
        copie?: copie?
      }) do
    new()
    |> to({"Test", "email@email.com"})
    |> from({"Contact site", email})
    |> subject("📬 Nouveau message: #{objet}")
    |> text_body("""
    Nom : #{nom}
    Email : #{email}

    Message :
    #{message}
    """)
    |> maybe_add_cc(copie?, email)
  end

  defp maybe_add_cc(email_struct, true, email), do: Swoosh.Email.put_cc(email_struct, email)
  defp maybe_add_cc(email_struct, false, _), do: email_struct
end
