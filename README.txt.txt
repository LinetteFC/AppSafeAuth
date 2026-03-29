En esta actividad se implementó una capa adicional en el proyecto llamada service, específicamente mediante la clase UsuarioService.java. Esta capa tiene como objetivo separar la lógica de negocio del acceso a datos, mejorando la organización del código y siguiendo buenas prácticas de desarrollo.

El UsuarioService actúa como intermediario entre el Servlet y el DAO. Su función principal es validar la información antes de que sea enviada a la base de datos, evitando que se registren datos incorrectos o incompletos. Por ejemplo, se verifican campos vacíos, formatos de correo válidos y reglas básicas de negocio antes de permitir la inserción o actualización de usuarios.

Además, esta implementación permite que el Servlet sea más limpio y sencillo, ya que delega las validaciones al service y solo se encarga de manejar las solicitudes HTTP (GET y POST) y redireccionar las respuestas.

También se aplicaron comentarios simples dentro del código para facilitar su comprensión, y se mantuvieron estándares de codificación como nombres claros en variables, métodos y clases.

Finalmente, se integró Bootstrap en las vistas JSP para mejorar la interfaz gráfica del sistema, logrando una aplicación web más organizada, funcional y visualmente profesional.