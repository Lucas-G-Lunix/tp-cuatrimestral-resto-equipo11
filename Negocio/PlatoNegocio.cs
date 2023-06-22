using Dominio;
using System;
using System.Collections.Generic;
using System.IO;

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
                datos.setearConsulta("SELECT p.Id, p.Nombre, t.Id AS IdTipo, t.Tipo, p.Precio, c.Id AS IdCategoria, c.Categoria FROM PLATOS p INNER JOIN TIPOS_PLATOS t ON t.Id = p.Tipo INNER JOIN CATEGORIAS_PLATOS c ON c.Id = p.Categoria");
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
                datos.setearConsulta("SELECT p.Id, p.Nombre, t.Id AS IdTipo, t.Tipo, p.Precio, c.Id AS IdCategoria, c.Categoria FROM PLATOS p INNER JOIN TIPOS_PLATOS t ON t.Id = p.Tipo INNER JOIN CATEGORIAS_PLATOS c ON c.Id = p.Categoria WHERE p.Id = @IdPLato");
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
    }
}