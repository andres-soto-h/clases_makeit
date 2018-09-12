require 'minitest/autorun'
require_relative 'ejercicio2'

class PhoneTest < Minitest::Test
  def setup
    @c1 = CellPhone.new(0.009)
    @c1.delete_contact('23542')
  end

  def test_class_of_instance
    assert_instance_of CellPhone, @c1
  end

  def test_create_contact
    @c1.create_contact('juan jimenez', '23542')
    assert_equal '23542', @c1.list_user_phone('juan jimenez')
  end

  def test_import_directory
    @c1.import_directory('../clase_4/directorio.csv')
  end

  def test_call_when_is_not_busy
    assert_equal 'Llamada iniciada.', @c1.call('pedro rodriguez', '12345')
end

  def test_call_when_is_busy
    @c1.call('pedro rodriguez', '12345')
    assert_equal 'El teléfono está ocupado.', @c1.call('pedro rodriguez', '12345')
  end

  def test_call_end
    @c1.call('pedro rodriguez', '12345')
    assert_equal 'Llamada finalizada.', @c1.end_call
  end

  def test_call_end_when_no_call
    assert_equal 'El teléfono no está en uso.', @c1.end_call
  end

  def test_get_call_info
    @c1.call('pedro rodriguez', '12345')
    refute_equal 'No hay llamadas en curso.', @c1.show_call_info 
  end

  def test_get_call_info_when_no_call
    assert_equal 'No hay llamadas en curso.', @c1.show_call_info 
  end

end
