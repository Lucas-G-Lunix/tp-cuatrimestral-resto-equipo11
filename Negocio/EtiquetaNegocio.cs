﻿using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class EtiquetaNegocio
    {
        public List<Etiqueta> listar(bool tipo)
        {
            AccesoDatos datos = new AccesoDatos();
            List<Etiqueta> etiquetas = new List<Etiqueta>();
            try
            {
                if (tipo)
                {
                    datos.setearConsulta("SELECT Id, Tipo FROM TIPOS_PLATOS");
                }
                else
                {
                    datos.setearConsulta("SELECT Id, Categoria FROM CATEGORIAS_PLATOS");
                }
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    Etiqueta etiqueta = new Etiqueta();
                    etiqueta.Id = (int)datos.Lector["Id"];
                    if (tipo)
                    {
                        etiqueta.Descripcion = (string)datos.Lector["Tipo"];
                    }
                    else
                    {
                        etiqueta.Descripcion = (string)datos.Lector["Categoria"];
                    }
                    etiquetas.Add(etiqueta);
                }
                return etiquetas;
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
