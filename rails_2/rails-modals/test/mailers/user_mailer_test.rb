require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test 'invite' do
    # Guardamos el email para futuros assertions
    email = UserMailer.create_invite('me@example',
                                     'you@example', Time.now)

    # Enviar el email y verificar que fue encolado
    assert_emails 1 do
      email.deliver_now
    end

    # Verificar que el contenido es el esperado
    assert_equal 'me@example', email.from[0]
    assert_equal 'you@example', email.to[0]
    assert_equal 'You have been invited by me@example', email.subject
    #assert_equal read_fixture('invite').join, email.body.to_s
  end
end
