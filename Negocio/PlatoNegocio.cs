using Dominio;
using System;
using System.Collections.Generic;

namespace Negocio
{
    public class PlatoNegocio
    {
        public List<Plato> listar()
        {
            AccesoDatos datos = new AccesoDatos();
            List<Plato> platos = new List<Plato>();
            try
            {
                datos.setearConsulta("SELECT p.Id, p.Nombre, t.Id AS IdTipo, t.Tipo, p.Precio, c.Id AS IdCategoria, c.Categoria, p.ImagenUrl AS Imagen FROM PLATOS p INNER JOIN TIPOS_PLATOS t ON t.Id = p.Tipo INNER JOIN CATEGORIAS_PLATOS c ON c.Id = p.Categoria");
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    Plato plato = new Plato();
                    plato.Id = (int)datos.Lector["Id"];
                    plato.Nombre = (string)datos.Lector["Nombre"];
                    plato.Tipo = new Etiqueta();
                    if (!(datos.Lector["IdTipo"] is DBNull))
                    {
                        plato.Tipo.Id = (int)datos.Lector["IdTipo"];
                    }
                    if (!(datos.Lector["Tipo"] is DBNull))
                    {
                        plato.Tipo.Descripcion = (string)datos.Lector["Tipo"];
                    }
                    if (!(datos.Lector["Precio"] is DBNull))
                    {
                        plato.Precio = (decimal)datos.Lector["Precio"];
                    }
                    plato.Categoria = new Etiqueta();
                    if (!(datos.Lector["IdCategoria"] is DBNull))
                    {
                        plato.Categoria.Id = (int)datos.Lector["IdCategoria"];
                    }
                    if (!(datos.Lector["Categoria"] is DBNull))
                    {
                        plato.Categoria.Descripcion = (string)datos.Lector["Categoria"];
                    }
                    if (!(datos.Lector["Imagen"] is DBNull))
                    {
                        plato.ImagenURL = (string)datos.Lector["Imagen"];
                    }
                    platos.Add(plato);
                }
                return platos;
            }
            catch (Exception)
            {

                throw;
            }
        }

        public Plato listar(int id)
        {
            AccesoDatos datos = new AccesoDatos();
            List<Plato> platos = new List<Plato>();
            try
            {
                datos.setearConsulta("SELECT p.Id, p.Nombre, t.Id AS IdTipo, t.Tipo, p.Precio, c.Id AS IdCategoria, c.Categoria, p.ImagenUrl AS Imagen FROM PLATOS p INNER JOIN TIPOS_PLATOS t ON t.Id = p.Tipo INNER JOIN CATEGORIAS_PLATOS c ON c.Id = p.Categoria WHERE p.Id = @IdPLato");
                datos.setearParametro("@IdPLato", id);
                datos.ejecutarLectura();
                Plato plato = new Plato();
                while (datos.Lector.Read())
                {

                    plato.Id = (int)datos.Lector["Id"];
                    plato.Nombre = (string)datos.Lector["Nombre"];
                    plato.Tipo = new Etiqueta();
                    if (!(datos.Lector["IdTipo"] is DBNull))
                    {
                        plato.Tipo.Id = (int)datos.Lector["IdTipo"];
                    }
                    if (!(datos.Lector["Tipo"] is DBNull))
                    {
                        plato.Tipo.Descripcion = (string)datos.Lector["Tipo"];
                    }
                    if (!(datos.Lector["Precio"] is DBNull))
                    {
                        plato.Precio = (decimal)datos.Lector["Precio"];
                    }
                    plato.Categoria = new Etiqueta();
                    if (!(datos.Lector["IdCategoria"] is DBNull))
                    {
                        plato.Categoria.Id = (int)datos.Lector["IdCategoria"];
                    }
                    if (!(datos.Lector["Categoria"] is DBNull))
                    {
                        plato.Categoria.Descripcion = (string)datos.Lector["Categoria"];
                    }
                    if (!(datos.Lector["Imagen"] is DBNull))
                    {
                        plato.ImagenURL = (string)datos.Lector["Imagen"];
                    }
                }
                return plato;
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        public void modificar(Plato nuevo)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("UPDATE PLATOS SET Nombre = @Nombre, Tipo = @Tipo, Categoria = @Categoria, Precio = @Precio, ImagenUrl = @ImagenUrl WHERE Id = @IdPLato");
                datos.setearParametro("@IdPLato", nuevo.Id);
                datos.setearParametro("@Nombre", nuevo.Id);
                datos.setearParametro("@Tipo", nuevo.Id);
                datos.setearParametro("@Categoria", nuevo.Id);
                datos.setearParametro("@Precio", nuevo.Id);
                datos.setearParametro("@ImagenUrl", nuevo.Id);
                datos.ejecutarAccion();
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        public void agregar(Plato nuevo)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("INSERT INTO PLATOS (Nombre, Tipo, Categoria, Precio, ImagenUrl) VALUES (@Nombre, @Tipo, @Categoria, @Precio, @ImagenUrl)");
                datos.setearParametro("@Nombre", nuevo.Id);
                datos.setearParametro("@Tipo", nuevo.Tipo);
                datos.setearParametro("@Categoria", nuevo.Categoria);
                datos.setearParametro("@Precio", nuevo.Precio);
                datos.setearParametro("@ImagenUrl", nuevo.ImagenURL);
                datos.ejecutarAccion();
            }
            catch (Exception)
            {
                throw;
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
                datos.setearConsulta("DELETE FROM PLATOS WHERE Id = @IdPlato");
                datos.setearParametro("@IdPlato", id);
                datos.ejecutarAccion();
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        public int ultimoId()
        {
            AccesoDatos datos = new AccesoDatos();
            int ultimoId = 0;
            try
            {
                datos.setearProcedimiento("SP_LastIdPlato");
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    ultimoId = (int)datos.Lector["Id"];
                }
                return ultimoId;
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }
    }
}