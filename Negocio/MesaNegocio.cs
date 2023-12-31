﻿using Dominio;
using System;
using System.Collections.Generic;

namespace Negocio
{
    public class MesaNegocio
    {
        public List<Mesa> listar()
        {
            AccesoDatos datos = new AccesoDatos();
            List<Mesa> mesas = new List<Mesa>();
            try
            {
                datos.setearConsulta("SELECT Id, NumeroMesa, IdPedido, IdMesero FROM MESAS");
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    Mesa mesa = new Mesa();
                    mesa.Id = (int)datos.Lector["Id"];
                    mesa.NumeroMesa = (int)datos.Lector["NumeroMesa"];
                    if (!(datos.Lector["IdPedido"] is DBNull))
                    {
                        mesa.IdPedido = (int)datos.Lector["IdPedido"];
                    }
                    if (!(datos.Lector["IdMesero"] is DBNull))
                    {
                        mesa.IdMesero = (int)datos.Lector["IdMesero"];
                    }
                    mesas.Add(mesa);
                }
                return mesas;
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

        public Mesa listar(int id)
        {
            AccesoDatos datos = new AccesoDatos();
            List<Mesa> mesas = new List<Mesa>();
            try
            {
                datos.setearConsulta("SELECT Id, NumeroMesa, IdPedido, IdMesero FROM MESAS WHERE Id = @Id");
                datos.setearParametro("@Id", id);
                datos.ejecutarLectura();
                Mesa mesa = new Mesa();
                while (datos.Lector.Read())
                {
                    mesa.Id = (int)datos.Lector["Id"];
                    mesa.NumeroMesa = (int)datos.Lector["NumeroMesa"];
                    if (!(datos.Lector["IdPedido"] is DBNull))
                    {
                        mesa.IdPedido = (int)datos.Lector["IdPedido"];
                    }
                    if (!(datos.Lector["IdMesero"] is DBNull))
                    {
                        mesa.IdMesero = (int)datos.Lector["IdMesero"];
                    }
                }
                return mesa;
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

        public List<Mesa> listarMesero(int idMesero)
        {
            AccesoDatos datos = new AccesoDatos();
            List<Mesa> mesas = new List<Mesa>();
            try
            {
                datos.setearConsulta("SELECT Id, NumeroMesa, IdPedido, IdMesero FROM MESAS WHERE IdMesero = @IdMesero");
                datos.setearParametro("@IdMesero", idMesero);
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    Mesa mesa = new Mesa();
                    mesa.Id = (int)datos.Lector["Id"];
                    mesa.NumeroMesa = (int)datos.Lector["NumeroMesa"];
                    if (!(datos.Lector["IdPedido"] is DBNull))
                    {
                        mesa.IdPedido = (int)datos.Lector["IdPedido"];
                    }
                    if (!(datos.Lector["IdMesero"] is DBNull))
                    {
                        mesa.IdMesero = (int)datos.Lector["IdMesero"];
                    }
                    mesas.Add(mesa);
                }
                return mesas;
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

        public void modificar(Mesa nuevo)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("UPDATE MESAS SET IdPedido = @IdPedido, IdMesero = @IdMesero WHERE Id = @Id");
                datos.setearParametro("@IdPedido", (object)nuevo.IdPedido ?? DBNull.Value);
                datos.setearParametro("@IdMesero", (object)nuevo.IdMesero ?? DBNull.Value);
                datos.setearParametro("@Id", nuevo.Id);
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
            List<Mesa> mesas = new List<Mesa>();
            try
            {
                datos.setearConsulta("DELETE FROM MESAS WHERE Id = @Id");
                datos.setearParametro("@Id", id);
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

        public void agregar()
        {
            AccesoDatos datos = new AccesoDatos();
            List<Mesa> mesas = new List<Mesa>();
            try
            {
                datos.setearProcedimiento("SP_NuevaMesa");
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
    }
}