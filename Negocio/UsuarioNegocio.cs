using Dominio;
using System;
using static System.Net.Mime.MediaTypeNames;
using System.Collections.Generic;

namespace Negocio
{
    public class UsuarioNegocio
    {
        public void insertarNuevo(Usuario nuevo)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("INSERT INTO USERS (Email, Pass, Nombre, Apellido, FechaNacimiento, RolAdmin) VALUES (@Email, @Pass, @Nombre, @Apellido, @FechaNacimiento, @RolAdmin)");
                datos.setearParametro("@Email", nuevo.Email);
                datos.setearParametro("@Pass", nuevo.Pass);
                datos.setearParametro("@Nombre", nuevo.Nombre);
                datos.setearParametro("@Apellido", nuevo.Apellido);
                datos.setearParametro("@FechaNacimiento", nuevo.FechaNacimiento);
                datos.setearParametro("@RolAdmin", false);
                datos.ejecutarAccion();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        public bool Login(Usuario usuario)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearProcedimiento("SP_Login");
                datos.setearParametro("@Email", usuario.Email);
                datos.setearParametro("@Pass", usuario.Pass);
                datos.ejecutarLectura();
                if (datos.Lector.Read())
                {
                    // , Email, Pass, , , , , 
                    usuario.Id = (int)datos.Lector["Id"];
                    usuario.RolAdmin = (bool)datos.Lector["RolAdmin"];
                    if (!(datos.Lector["ProfileImage"] is DBNull))
                        usuario.ImagenURL = (string)datos.Lector["ProfileImage"];
                    if (!(datos.Lector["Nombre"] is DBNull))
                        usuario.Nombre = (string)datos.Lector["Nombre"];
                    if (!(datos.Lector["Apellido"] is DBNull))
                        usuario.Apellido = (string)datos.Lector["Apellido"];
                    if (!(datos.Lector["FechaNacimiento"] is DBNull))
                        usuario.FechaNacimiento = DateTime.Parse(datos.Lector["FechaNacimiento"].ToString());

                    return true;
                }
                return false;

            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        public bool existeUser(string mail)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("SELECT * FROM USERS WHERE Email = @Email");
                datos.setearParametro("@Email", mail);
                datos.ejecutarLectura();
                if (datos.Lector.Read())
                {
                    return true;
                }
                return false;

            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        public int idUser(string mail)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("SELECT Id FROM USERS WHERE Email = @Email");
                datos.setearParametro("@Email", mail);
                datos.ejecutarLectura();
                if (datos.Lector.Read())
                {
                    return (int)datos.Lector["Id"];
                }
                return -1;

            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        public void actualizar(Usuario user)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("UPDATE USERS SET Email = @Email, Nombre = @Nombre, Apellido = @Apellido, FechaNacimiento = @Fecha, ProfileImage = @Image Where Id = @Id");
                datos.setearParametro("@Email", user.Email);
                datos.setearParametro("@Image", (object)user.ImagenURL ?? DBNull.Value);
                datos.setearParametro("@Nombre", user.Nombre);
                datos.setearParametro("@Apellido", user.Apellido);
                datos.setearParametro("@Fecha", user.FechaNacimiento);
                datos.setearParametro("@Id", user.Id);
                datos.ejecutarAccion();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();



            }
        }

        public void actualizarContraseña(int id, string contraseña)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("UPDATE USERS SET Pass = @Pass WHERE Id = @Id");
                datos.setearParametro("@Pass", contraseña);
                datos.setearParametro("@Id", id);
                datos.ejecutarAccion();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();



            }
        }

        public void cambiarAdmin(int id, bool admin)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                if (admin)
                {
                    datos.setearConsulta("UPDATE USERS SET RolAdmin = 1 Where Id = @Id");
                } else
                {
                    datos.setearConsulta("UPDATE USERS SET RolAdmin = 0 Where Id = @Id");
                }
                datos.setearParametro("@Id", id);
                datos.ejecutarAccion();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();



            }
        }


        public void eliminar(int id)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("DELETE USERS Where Id = @Id");
                datos.setearParametro("@Id", id);
                datos.ejecutarAccion();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();



            }
        }

        public List<Usuario> listar()
        {
            AccesoDatos datos = new AccesoDatos();
            List<Usuario> usuarios = new List<Usuario>();
            try
            {
                datos.setearConsulta("SELECT Id, Email, Nombre, Apellido FROM USERS WHERE RolAdmin = 0");
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    Usuario usuario = new Usuario();
                    usuario.Id = (int)datos.Lector["Id"];
                    usuario.Email = (string)datos.Lector["Email"];
                    usuario.Nombre = (string)datos.Lector["Nombre"];
                    usuario.Apellido = (string)datos.Lector["Apellido"];
                    usuarios.Add(usuario);
                }
                return usuarios;
            }
            catch (Exception)
            {

                throw;
            }
        }

        public List<Usuario> listarTodos()
        {
            AccesoDatos datos = new AccesoDatos();
            List<Usuario> usuarios = new List<Usuario>();
            try
            {
                datos.setearConsulta("SELECT Id, Email, Nombre, Apellido, RolAdmin FROM USERS");
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    Usuario usuario = new Usuario();
                    usuario.Id = (int)datos.Lector["Id"];
                    usuario.Email = (string)datos.Lector["Email"];
                    usuario.Nombre = (string)datos.Lector["Nombre"];
                    usuario.Apellido = (string)datos.Lector["Apellido"];
                    usuario.RolAdmin = (bool)datos.Lector["RolAdmin"];
                    usuarios.Add(usuario);
                }
                return usuarios;
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}
