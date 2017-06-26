    $(document).ready(function () {
                // Esta primera parte crea un loader no es necesaria
                $().ajaxStart(function () {
                    $('#loading').show();
                    $('#result').hide();
                }).ajaxStop(function () {
                    $('#loading').hide();
                    $('#result').fadeIn('slow');
                });
                // Interceptamos el evento submit
                $('#form, #fat, #dataEnviar').submit(function () {
                    // Enviamos el formulario usando AJAX
                    $.ajax({
                        type: 'POST',
                        url: $(this).attr('action'),
                        data: $(this).serialize(),
                        // Mostramos un mensaje con la respuesta de PHP
                        success: function (data) {
                            alert('Documento enviado');
                            $('#result').html(data);
                            document.getElementById("dataEnviar").reset();

                        }
                    })
                    return false;
                });
            })
            
            
            
          