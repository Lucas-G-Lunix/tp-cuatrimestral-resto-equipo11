using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class UsuarioNegocio
    {
        //public int insertarNuevo(Usuario nuevo)
        //{
        //    AccesoDatos datos = new AccesoDatos();

        //    try
        //    {
        //        datos.setearProcedimiento("insertarNuevo");
        //        datos.setearParametro("@email", nuevo.Email);
        //        datos.setearParametro("@pass", nuevo.Pass);
        //        return datos.ejecutarAccionScalar();
        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //    finally
        //    {
        //        datos.cerrarConexion();
        //    }

        //}

        //public void actualizar(Usuario user)
        //{
        //    AccesoDatos datos = new AccesoDatos();
        //    try
        //    {
        //        datos.setearConsulta("Update USERS set imagenPerfil = @imagen, Nombre = @nombre, Apellido = @apellido, fechaNacimiento = @fecha Where Id = @id");
        //        //datos.setearParametro("@imagen", user.ImagenPerfil != null ? user.ImagenPerfil : (object)DBNull.Value);
        //        datos.setearParametro("@imagen", (object)user.ImagenPerfil ?? DBNull.Value);
        //        datos.setearParametro("@nombre", user.Nombre);
        //        datos.setearParametro("@apellido", user.Apellido);
        //        datos.setearParametro("@fecha", user.FechaNacimiento);
        //        datos.setearParametro("@id", user.Id);
        //        datos.ejecutarAccion();

        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //    finally
        //    {
        //        datos.cerrarConexion();
        //    }
        //}

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
    }
}
